#!/usr/bin/env bash

if [ ! -n "$REPO_URL" ]
then
  fail "Missing or empty option REPO_URL"
fi

git clone $REPO_URL $WERCKER_SOURCE_DIR/project
