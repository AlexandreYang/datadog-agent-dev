# datadog-agent-dev

## Setup

```
git clone https://github.com/DataDog/datadog-agent.git ./data
vagrant up
```

## Workflow

The `./data/datadog-agent` git repository is shared with the vagranat VM.

It's mapped to `/home/vagrant/work/src/github.com/DataDog/datadog-agent`.


## Useful Commmand

```
vagrant ssh

inv agent.build --build-exclude=systemd
inv test --targets=./pkg/collector/check
```
