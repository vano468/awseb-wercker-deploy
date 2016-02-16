#!/usr/bin/env bash

cd $WERCKER_SOURCE_DIR/project && eb deploy --timeout 10
