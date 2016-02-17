#!/usr/bin/env bash

if [ ! -n "$REPO_URL" ]
then
  echo "Missing or empty option REPO_URL"
  exit 2
fi

git clone $REPO_URL $WERCKER_SOURCE_DIR/project
