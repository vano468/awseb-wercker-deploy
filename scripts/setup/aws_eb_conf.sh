#!/usr/bin/env bash

if [ ! -n "$AWS_ACCESS_KEY_ID" ]
then
  echo "Missing or empty option AWS_ACCESS_KEY_ID"
  exit 2
fi

if [ ! -n "$AWS_SECRET_ACCESS_KEY" ]
then
  echo "Missing or empty option AWS_SECRET_ACCESS_KEY"
  exit 2
fi

if [ ! -n "$AWS_REGION" ]
then
  echo "Missing or empty option AWS_REGION"
  exit 2
fi

if [ ! -n "$EB_APP" ]
then
  echo "Missing or empty option EB_APP"
  exit 2
fi

if [ ! -n "$EB_ENV" ]
then
  echo "Missing or empty option EB_ENV"
  exit 2
fi

mkdir -p $HOME/.aws
mkdir -p $WERCKER_SOURCE_DIR/project/.elasticbeanstalk

cat <<EOT>> $HOME/.aws/credentials
[default]
aws_access_key_id=$AWS_ACCESS_KEY_ID
aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
EOT

cat <<EOT>> $HOME/.aws/config
[default]
output = text
region = $AWS_REGION
EOT

cat <<EOT>> $WERCKER_SOURCE_DIR/project/.elasticbeanstalk/config.yml
branch-defaults:
  $WERCKER_GIT_BRANCH:
    environment: $EB_ENV
global:
  application_name: $EB_APP
  default_platform: null
  default_region: $AWS_REGION
  profile: default
  sc: git
EOT
