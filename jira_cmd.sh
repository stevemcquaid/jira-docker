#!/bin/sh
set -ex

# QUERY="project = K8S AND text ~ \"$@\""

# /go/bin/jira --endpoint=$JIRA_ENDPOINT --user=$JIRA_EMAIL list -q "$QUERY"

/go/bin/jira --endpoint=$JIRA_ENDPOINT --user=$JIRA_EMAIL "$@"