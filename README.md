tarballcli
==========



[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![Version](https://img.shields.io/npm/v/tarballcli.svg)](https://npmjs.org/package/tarballcli)
[![Downloads/week](https://img.shields.io/npm/dw/tarballcli.svg)](https://npmjs.org/package/tarballcli)
[![License](https://img.shields.io/npm/l/tarballcli.svg)](https://github.com/VerasThiago/tarballcli/blob/master/package.json)

<!-- toc -->
* [Usage](#usage)
* [Commands](#commands)
<!-- tocstop -->
# Usage
<!-- usage -->
```sh-session
$ npm install -g tarballcli
$ tarballcli COMMAND
running command...
$ tarballcli (-v|--version|version)
tarballcli/0.0.0 darwin-x64 node-v14.9.0
$ tarballcli --help [COMMAND]
USAGE
  $ tarballcli COMMAND
...
```
<!-- usagestop -->
# Commands
<!-- commands -->
* [`tarballcli help [COMMAND]`](#tarballcli-help-command)
* [`tarballcli salve [FILE]`](#tarballcli-salve-file)
* [`tarballcli update [CHANNEL]`](#tarballcli-update-channel)

## `tarballcli help [COMMAND]`

display help for tarballcli

```
USAGE
  $ tarballcli help [COMMAND]

ARGUMENTS
  COMMAND  command to show help for

OPTIONS
  --all  see all commands in CLI
```

_See code: [@oclif/plugin-help](https://github.com/oclif/plugin-help/blob/v3.2.0/src/commands/help.ts)_

## `tarballcli salve [FILE]`

Display basic message

```
USAGE
  $ tarballcli salve [FILE]

OPTIONS
  -f, --force
  -h, --help       show CLI help
  -n, --name=name  name to print

EXAMPLE
  $ tarballcli salve
```

_See code: [src/commands/salve.ts](https://github.com/VerasThiago/tarballcli/blob/v0.0.0/src/commands/salve.ts)_

## `tarballcli update [CHANNEL]`

update the tarballcli CLI

```
USAGE
  $ tarballcli update [CHANNEL]
```

_See code: [@oclif/plugin-update](https://github.com/oclif/plugin-update/blob/v1.3.10/src/commands/update.ts)_
<!-- commandsstop -->
