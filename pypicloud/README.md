# PyPi Cloud Server

Run a private pypi server that is backed by s3.

## Usage

This image relies on having the secret part of the pypi server config stored in an s3 bucket.  When calling the image specify the name of the bucket in an environment variable.  There is a template provided in this repository

*NOTE* you will have to supply the AWS API keys in the config file, this project uses an older version of the API that does not understand task roles.

This image can be easily deployed to ECS.  Below is an example config:

```
{
  "requiresAttributes": [
    {
      "value": null,
      "name": "com.amazonaws.ecs.capability.logging-driver.syslog",
      "targetId": null,
      "targetType": null
    },
    {
      "value": null,
      "name": "com.amazonaws.ecs.capability.task-iam-role",
      "targetId": null,
      "targetType": null
    },
    {
      "value": null,
      "name": "com.amazonaws.ecs.capability.docker-remote-api.1.19",
      "targetId": null,
      "targetType": null
    }
  ],
  "taskDefinitionArn": "arn:aws:ecs:us-east-1:121212121212:task-definition/pypi_prod:2",
  "networkMode": "bridge",
  "status": "ACTIVE",
  "revision": 2,
  "taskRoleArn": "arn:aws:iam::121212121212:role/pypi-task-role",
  "containerDefinitions": [
    {
      "volumesFrom": [],
      "memory": 256,
      "extraHosts": null,
      "dnsServers": null,
      "disableNetworking": null,
      "dnsSearchDomains": null,
      "portMappings": [
        {
          "hostPort": 6543,
          "containerPort": 6543,
          "protocol": "tcp"
        }
      ],
      "hostname": null,
      "essential": true,
      "entryPoint": null,
      "mountPoints": [],
      "name": "pypi",
      "ulimits": null,
      "dockerSecurityOptions": null,
      "environment": [
        {
          "name": "S3_CONFIG_BUCKET",
          "value": "supercoolconfigbucket"
        }
      ],
      "links": null,
      "workingDirectory": null,
      "readonlyRootFilesystem": null,
      "image": "cucloudcollab/pypi",
      "command": null,
      "user": null,
      "dockerLabels": null,
      "logConfiguration": {
        "logDriver": "syslog",
        "options": {
          "tag": "pypi"
        }
      },
      "cpu": 0,
      "privileged": null,
      "memoryReservation": null
    }
  ],
  "placementConstraints": [],
  "volumes": [],
  "family": "pypi_prod"
}
```

Example IAM policy to use with the API credentials

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:ListBucket"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::some-code-library"
        },
        {
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::some-code-library/*"
        },
        {
            "Action": [
                "s3:GetObject"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::supercoolconfigbucket/pypi-secret.ini"
        }
    ]
}
```

## Versions
This image pulls from base alpine and is pushed to the public docker repo cucloudcollab/pypi
