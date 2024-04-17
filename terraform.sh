#!/usr/bin/env bash

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
TERRAFORM_LOCATION=/c/development/tools/terraform_1.8.0_windows_amd64/terraform

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
