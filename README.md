# Jira Docker CLI

This is a docker-wrapper for [Netflix's go-jira](https://github.com/Netflix-Skunkworks/go-jira) package offering a CLI for interacting with Jira.

# Setup Overview
To use this project, you must should create a jira.config to store creds to access Jira's API.

You will need a Jira API_Token, email address, and jira URL/endpoint if applicable.
Use this URL to create an API_TOKEN: https://id.atlassian.com/manage/api-tokens

``` 
# Clone repo
git clone https://github.com/stevemcquaid/jira-docker.git
cd jira-docker

# Create API Token
open "https://id.atlassian.com/manage/api-tokens"

# Assign the variables
JIRA_API_TOKEN=<MY_TOKEN>
JIRA_EMAIL=<MY_EMAIL>
JIRA_ENDPOINT=<MY_JIRA_URL>

# Create the jira.config file
echo "JIRA_API_TOKEN=$JIRA_API_TOKEN" >> jira.config
echo "JIRA_EMAIL=$JIRA_EMAIL" >> jira.config 
echo "JIRA_ENDPOINT=$JIRA_ENDPOINT" >> jira.config

## Alias jira docker command
echo "alias jiraD=\"$PWD/scripts/run.sh\"" >> ~/.bash_profile

# Check if it works!
source ~/.bash_profile
jiraD list
```

# TL;DR Setup
You need a Jira API Token: https://id.atlassian.com/manage/api-tokens

Once you have a token you can run something like this:
`docker run -it -e "JIRA_API_TOKEN=MYSECRETTOKEN" -e "JIRA_EMAIL=USER@COMPANY.com" -e "JIRA_ENDPOINT=https://COMPANY.atlassian.net" stevemcquaid/jira:latest list -q 'project = K8S AND text ~ "TLS handshake timeout"'`

Follow the above steps to make things easier on yourself by using a jira.config file instead

# Example Usage
```
# View project make targets
make help

# Build container manually
make build

# Run jira command & view help
make run

# View all jira issues without alias
docker run -it --env-file jira.config stevemcquaid/jira:latest list

# View all jira issues with alias
jiraD list

# View all issues in the K8S project that contain the text: "TLS handshake timeout" without alias
docker run -it --env-file jira.config stevemcquaid/jira:latest list  -q 'project = K8S AND text ~ "TLS handshake timeout"'
docker run -it -e "JIRA_API_TOKEN=MYSECRETTOKEN" -e "JIRA_EMAIL=USERNAME@COMPANY.com" -e "JIRA_ENDPOINT=https://COMPANY.atlassian.net" stevemcquaid/jira:latest list -q 'project = K8S AND text ~ "TLS handshake timeout"'

# View all issues in the K8S project that contain the text: "TLS handshake timeout" with alias
jiraD list  -q 'project = K8S AND text ~ "TLS handshake timeout"'
```
