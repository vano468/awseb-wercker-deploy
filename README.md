# AWS ElasticBeanstalk Wercker Deploy

## Description
When I used existing solutions for deploying project to ElasticBeanstalk (docker environment) via Wercker, I've got various unexpected errors, such as `docker container quit unexpectedly after launch` and others, but deployment from local via `eb deploy` worked fine. It very strange btw.

So I developed necessary docker image and wercker deploy config, which always works, like local `eb deploy`.

## Usage
Add this piece of code to you wercker yml:
```
deploy:
  box: vano468/awseb-wercker-deploy
  steps:
    - script:
        name: set up ssh key (optional)
        code: /opt/setup/github_ssh_key.sh
    - script:
        name: clone project
        code: /opt/action/clone_repo.sh
    - script:
        name: setup aws and eb config
        code: /opt/setup/aws_eb_conf.sh
    - script:
        name: check EB status
        code: /opt/action/eb_status.sh
    - script:
        name: deploy to EB
        code: /opt/action/eb_deploy.sh
```
You can use you own Docker image instead of `vano468/awseb-wercker-deploy`.
You need to build and push image via `make build` / `make push`.

## Environment variables
You need to set these variables for deployment in project settings on app.wercker.com.
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION (ex: us-west-2)

EB_APP (elasticbeanstalk application name)
EB_ENV (elasticbeanstalk application environment)

REPO_URL (repo with project to deploy, ex: git@github.com:<username>/<project>.git)
GITHUB_SSH_KEY (private key, optional, required if repo is private)
```
