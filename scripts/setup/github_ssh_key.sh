#!/usr/bin/env bash

if [ ! -n "$GITHUB_SSH_KEY" ]
then
  echo "Missing or empty option GITHUB_SSH_KEY"
  exit 2
fi

SSH_PATH=~/.ssh 
mkdir -p $SSH_PATH

cat <<EOT>> $SSH_PATH/config
Host *
	StrictHostKeyChecking no
Host github
	HostName github.com
  User git
  IdentityFile /home/.ssh/id_rsa
EOT

echo -e $GITHUB_SSH_KEY > $SSH_PATH/id_rsa
chmod 400 $SSH_PATH/id_rsa
