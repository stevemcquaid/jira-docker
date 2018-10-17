# Jira Docker CLI

This is a docker-wrapper for [Netflix's go-jira](https://github.com/Netflix-Skunkworks/go-jira) package offering a CLI for interacting with Jira.

# Setup
To use this project, you must to create a jira.config to access Jira's API.

Use this URL to create an API_TOKEN: https://id.atlassian.com/manage/api-tokens

``` 
open "https://id.atlassian.com/manage/api-tokens"
cd jira-docker

# Create jira.config file
cp jira.config.example jira.config

# Edit jira.config file with correct values
vim jira.config
```

# Usage
#### To view make targets
`make help`

#### To build the docker container
`make build`

#### To run jira and show help diagram
`make run`

#### View all jira issues
```
docker run -it --env-file jira.config stevemcquaid/jira:latest list
```

#### View all issues in the K8S project that contain the text: "Unable to connect to the server: net/http: TLS handshake timeout"
```
docker run -it --env-file jira.config stevemcquaid/jira:latest list  -q 'project = K8S AND text ~ "Unable to connect to the server: net/http: TLS handshake timeout"'
```

## Alias jira docker command
```
vim ~/.bash_profile

alias jira="./scripts/run.sh"
```

Then in your shell you can just use go-jira normally:
```
jira list  -q 'project = K8S AND text ~ "Unable to connect to the server: net/http: TLS handshake timeout"'
```