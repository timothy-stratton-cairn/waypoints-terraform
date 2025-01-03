# waypoint-terraform


# syntax
$ terraform.sh <The Environment -- qa, dev, etc> <module_name, waypoint-dashboard-api, etc> <terraform command -> init, plan, apply, or etc>


$ aws ssm describe-parameters
{
    "Parameters": [
        {
            "Name": "/demo/authorization/DB_PASSWORD",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/demo/authorization/DB_PASSWORD",
            "Type": "SecureString",
            "KeyId": "alias/aws/ssm",
            "LastModifiedDate": "2024-04-17T21:09:44.933000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:user/deploy_service",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/demo/authorization/DB_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/demo/authorization/DB_URL",
            "Type": "String",
            "LastModifiedDate": "2024-04-17T21:13:32.230000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:user/deploy_service",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/demo/authorization/DB_USERNAME",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/demo/authorization/DB_USERNAME",
            "Type": "String",
            "LastModifiedDate": "2024-04-17T21:13:32.234000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:user/deploy_service",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/demo/waypoints-authorization-api-ec2-instance/PUBLIC_IP_ADDRESS",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/demo/waypoints-authorization-api-ec2-instance/PUBLIC_IP_ADDRESS",
            "Type": "String",
            "LastModifiedDate": "2024-04-17T21:21:01.903000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:user/deploy_service",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/demo/waypoints-dashboard-api-ec2-instance/PUBLIC_IP_ADDRESS",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/demo/waypoints-dashboard-api-ec2-instance/PUBLIC_IP_ADDRESS",
            "Type": "String",
            "LastModifiedDate": "2024-04-17T21:23:15.021000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:user/deploy_service",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/demo/waypoints-ui-ec2-instance/PUBLIC_IP_ADDRESS",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/demo/waypoints-ui-ec2-instance/PUBLIC_IP_ADDRESS",
            "Type": "String",
            "LastModifiedDate": "2024-04-17T21:25:16.899000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:user/deploy_service",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/waypoints-ui/AUTHORIZATION_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/waypoints-ui/AUTHORIZATION_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T18:46:26.319000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 3,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/waypoints-ui/DASHBOARD_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/waypoints-ui/DASHBOARD_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T18:46:37.682000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 3,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/ENCRYPTED_FIELD_SECRET_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/ENCRYPTED_FIELD_SECRET_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:00:06.958000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/S3_BUCKET",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/S3_BUCKET",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:02:00.911000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/APP_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/APP_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T18:46:47.592000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 3,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/DASHBOARD_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/DASHBOARD_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T18:46:56.740000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 3,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/DB_BACKUP_URL_PATH",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/DB_BACKUP_URL_PATH",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T08:59:52.259000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/ENCRYPTED_FIELDS_ENABLED",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/ENCRYPTED_FIELDS_ENABLED",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:00:38.206000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/ENCRYPTED_FIELD_SALT",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/ENCRYPTED_FIELD_SALT",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:00:23.196000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/OAUTH2_PRIVATE_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/OAUTH2_PRIVATE_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:01:05.980000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/OAUTH2_PUBLIC_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/OAUTH2_PUBLIC_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:00:50.940000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/RESET_PASSWORD_LINK",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/RESET_PASSWORD_LINK",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:01:20.763000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-authorization-api/S3_DB_DUMP_PATH",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-authorization-api/S3_DB_DUMP_PATH",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:02:16.949000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/HOMEWORK_RESPONSE_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/HOMEWORK_RESPONSE_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:04:02.240000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/APP_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/APP_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T18:47:04.980000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 3,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/AUTH_API_ISSUER_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/AUTH_API_ISSUER_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T18:47:12.026000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 3,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/DB_DUMP_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/DB_DUMP_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:04:22.240000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/EMAIL_NOTIFICATION_QUEUE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/EMAIL_NOTIFICATION_QUEUE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-12T00:54:17.061000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/IMPORT_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/IMPORT_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:03:45.045000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/S3_BUCKET",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/S3_BUCKET",
            "Type": "String",
            "LastModifiedDate": "2024-07-10T09:03:16.444000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/dev/wp-dashboard-api/STEP_ATTACHMENT_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/dev/wp-dashboard-api/STEP_ATTACHMENT_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-12T01:05:06.970000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/waypoints-ui/AUTHORIZATION_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/waypoints-ui/AUTHORIZATION_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:54:07.892000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/waypoints-ui/DASHBOARD_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/waypoints-ui/DASHBOARD_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:54:35.466000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/ENCRYPTED_FIELD_SECRET_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/ENCRYPTED_FIELD_SECRET_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:45:04.540000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/APP_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/APP_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:43:33.101000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/DASHBOARD_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/DASHBOARD_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:44:05.305000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/DB_BACKUP_URL_PATH",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/DB_BACKUP_URL_PATH",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:44:38.331000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/ENCRYPTED_FIELDS_ENABLED",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/ENCRYPTED_FIELDS_ENABLED",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:45:40.982000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/ENCRYPTED_FIELD_SALT",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/ENCRYPTED_FIELD_SALT",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:45:20.702000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/OAUTH2_PRIVATE_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/OAUTH2_PRIVATE_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:47:13.490000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/OAUTH2_PUBLIC_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/OAUTH2_PUBLIC_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:46:24.300000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/RESET_PASSWORD_LINK",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/RESET_PASSWORD_LINK",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:47:27.543000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/S3_BUCKET",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/S3_BUCKET",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:47:47.253000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-authorization-api/S3_DB_DUMP_PATH",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-authorization-api/S3_DB_DUMP_PATH",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:47:59.370000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/APP_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/APP_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:48:47.531000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/AUTH_API_ISSUER_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/AUTH_API_ISSUER_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:51:15.511000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/DB_DUMP_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/DB_DUMP_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:50:10.857000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/EMAIL_NOTIFICATION_QUEUE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/EMAIL_NOTIFICATION_QUEUE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:50:54.346000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/HOMEWORK_RESPONSE_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/HOMEWORK_RESPONSE_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:49:55.903000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/IMPORT_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/IMPORT_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:49:42.570000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/S3_BUCKET",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/S3_BUCKET",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:49:21.454000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/prd/wp-dashboard-api/STEP_ATTACHMENT_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/prd/wp-dashboard-api/STEP_ATTACHMENT_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:50:30.652000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/waypoints-ui/AUTHORIZATION_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/waypoints-ui/AUTHORIZATION_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:13:47.918000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/waypoints-ui/DASHBOARD_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/waypoints-ui/DASHBOARD_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:14:28.403000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/APP_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/APP_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:00:29.487000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/DASHBOARD_API_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/DASHBOARD_API_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:04:53.954000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/DB_BACKUP_URL_PATH",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/DB_BACKUP_URL_PATH",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:05:36.750000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/ENCRYPTED_FIELDS_ENABLED",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/ENCRYPTED_FIELDS_ENABLED",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:06:49.268000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/ENCRYPTED_FIELD_SALT",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/ENCRYPTED_FIELD_SALT",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:06:39.827000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/ENCRYPTED_FIELD_SECRET_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/ENCRYPTED_FIELD_SECRET_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:05:54.865000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/OAUTH2_PRIVATE_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/OAUTH2_PRIVATE_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:07:49.788000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/OAUTH2_PUBLIC_KEY",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/OAUTH2_PUBLIC_KEY",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:07:35.467000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/S3_BUCKET",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/S3_BUCKET",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:01:07.449000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/S3_DB_DUMP_PATH",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/S3_DB_DUMP_PATH",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:08:20.180000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-authorization-api/RESET_PASSWORD_LINK",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-authorization-api/RESET_PASSWORD_LINK",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:08:08.709000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/APP_BASE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/APP_BASE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:11:17.429000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/AUTH_API_ISSUER_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/AUTH_API_ISSUER_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T21:03:25.048000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 2,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/DB_DUMP_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/DB_DUMP_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:10:26.485000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/EMAIL_NOTIFICATION_QUEUE_URL",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/EMAIL_NOTIFICATION_QUEUE_URL",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:12:09.845000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/HOMEWORK_RESPONSE_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/HOMEWORK_RESPONSE_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:10:16.460000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/IMPORT_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/IMPORT_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:10:03.411000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/S3_BUCKET",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/S3_BUCKET",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:11:34.790000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "/qa/wp-dashboard-api/STEP_ATTACHMENT_KEY_PREFIX",
            "ARN": "arn:aws:ssm:us-east-1:471112975273:parameter/qa/wp-dashboard-api/STEP_ATTACHMENT_KEY_PREFIX",
            "Type": "String",
            "LastModifiedDate": "2024-07-13T20:10:39.439000-05:00",
            "LastModifiedUser": "arn:aws:iam::471112975273:root",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        }
    ]
}
