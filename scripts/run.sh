#!/bin/bash
set -ex

docker run -it --env-file jira.config stevemcquaid/jira:latest "$@"
