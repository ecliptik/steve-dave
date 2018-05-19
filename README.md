# Random Slack Status Update

![steve-dave](https://raw.githubusercontent.com/ecliptik/steve-dave/master/steve-dave.gif)

[Docker](https://www.docker.com) container to automatically update [Slack](https://slack.com) status.

Inspired by [benpbolton/slack-autostatus/](https://github.com/benpbolton/slack-autostatus).

Container will do the following
- Run in a loop
- At random intervals send message + emoji payload to update Slack workspace status

## Requirements
Create Slack Personal Token for workspace to auto-update
 - https://api.slack.com/custom-integrations/legacy-tokens

## Build

```
docker build -t steve-dave .
```

## Run

Run container passing the SLACK_PERSONAL_TOKEN generated in the Requirements step. Run in background to continually update status at random intervals.

```
docker run -it -e "SLACK_PERSONAL_TOKEN=xoxp-XXXXXXXXXXXXXXXXXXXXXX" steve-dave -d
```

or with [docker-compose](https://docs.docker.com/compose/), create a `.env` file with SLACK_PERSONAL_TOKEN=xoxp-XXXXXXXXXXXXXXXXXXXXXX and run,

```
docker-compose up -d
```
