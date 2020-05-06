# datadog-agent-dev

[![Build Status](https://travis-ci.org/AlexandreYang/datadog-agent-dev.svg?branch=master)](https://travis-ci.org/AlexandreYang/datadog-agent-dev)


## Setup

```
git clone https://github.com/DataDog/datadog-agent.git ./data
vagrant up
```

## Useful Commmand

```
vagrant ssh

inv agent.build --python-runtimes 3
inv test --targets=./pkg/collector/check
```

## Workflow

The `./data/datadog-agent` git repository mounted/synced to VM `/home/vagrant/work/src/github.com/DataDog/datadog-agent`.

You can locally work on the `./data/datadog-agent` and run `invoke` command inside the VM.