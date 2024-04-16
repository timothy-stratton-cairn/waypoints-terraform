#!/usr/bin/env bash

TERRAFORM_VERSION=1.0.0

function getWorkspaceDir() {
    MY_PATH="$(dirname "$0")"         # relative
    MY_PATH="$(cd "$MY_PATH" && pwd)" # absolutized and normalized
    if [ -z "$MY_PATH" ]; then
        # error; for some reason, the path is not accessible
        # to the script (e.g. permissions re-evaled after suid)
        exit 1 # fail
    fi
    echo "$MY_PATH"
}

set -e

#
WORKSPACE=$(getWorkspaceDir)
GLOBAL_PATH=$WORKSPACE/global
ENVIRONMENT=$1
STACK=$2
ACTION=$3

if [ ! $ACTION ]; then
    echo "too few arguments"
    exit 1
fi

ACTION_ARGS=$(echo "$@" | awk '{first = $1; second = $2; third = $3; $1 = ""; $2 = ""; $3 = ""; print $0 }')
OS_SHORTNAME=$(uname | awk '{print tolower($0)}')
TERRAFORM_LOCATION=/c/development/tools/terraform-1.6.2/terraform

## Validate Terrform version
CURRENT_VERSION=$($TERRAFORM_LOCATION --version 2>/dev/null | head -1 | awk '{print $2}' | sed 's/^v//')
if [ ! "$CURRENT_VERSION" == "$TERRAFORM_VERSION" ]; then
    FILE=$(mktemp)
    echo "This project is currently using terraform v$TERRAFORM_VERSION. You're at v$CURRENT_VERSION. Installing terraform@${TERRAFORM_VERSION}..."
    if [ "$(uname)" == "Darwin" ]; then
        curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_darwin_amd64.zip -o $FILE
        unzip -o $FILE -d $WORKSPACE/bin
        rm -rf $FILE
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        curl -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o $FILE && unzip -o $FILE -d $WORKSPACE/bin && rm -rf $FILE
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
        echo "You're running windows. Do it yourself."
    fi
fi

echo ""
echo "=============================================================================="
echo " Executing terraform $ACTION against the $STACK stack in $ENVIRONMENT. "
echo "=============================================================================="
echo ""

export STACK

export TARGET_DIR=$WORKSPACE/environments/$ENVIRONMENT/$STACK

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Stack \"$STACK\" does not exist in environment \"$ENVIRONMENT\"."
    exit 1
fi

cd $TARGET_DIR

export CMD="$TERRAFORM_LOCATION $ACTION $ACTION_ARGS"

if [ ! -d "$WORKSPACE/environments/$ENVIRONMENT/$STACK/.terraform" ]; then
    echo "initalizing stack"
    $TERRAFORM_LOCATION init
fi

$TERRAFORM_LOCATION get -update

set +e
$TERRAFORM_LOCATION workspace select $ENVIRONMENT >/dev/null 2>&1
if [ "$?" -eq "1" ]; then
    echo "creating new environment: $ENVIRONMENT for stack $STACK"
    $TERRAFORM_LOCATION workspace new $ENVIRONMENT
fi
set -e

$CMD
