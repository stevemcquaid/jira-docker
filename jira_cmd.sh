#!/bin/sh
set -ex

/go/bin/jira --endpoint=$JIRA_ENDPOINT --user=$JIRA_EMAIL "$@"