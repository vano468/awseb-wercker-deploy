#!/usr/bin/env bash

cd $WERCKER_SOURCE_DIR/project && eb status > /tmp/eb_status
cat /tmp/eb_status
cat /tmp/eb_status | grep Status
