FROM    golang:1.11.1-alpine3.8

RUN     apk add --no-cache git mercurial

RUN     go get gopkg.in/Netflix-Skunkworks/go-jira.v1/cmd/jira

RUN     echo 'jira --endpoint=$JIRA_ENDPOINT --user=$JIRA_EMAIL $@' >> /jira_cmd.sh
RUN     chmod u+x /jira_cmd.sh

ENTRYPOINT ["/bin/ash", "/jira_cmd.sh"]