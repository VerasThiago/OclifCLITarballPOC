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
tarballcli/0.0.0 linux-x64 node-v14.0.0
$ tarballcli --help [COMMAND]
USAGE
  $ tarballcli COMMAND
...
```
<!-- usagestop -->
# Commands
<!-- commands -->
* [`tarballcli hello [FILE]`](#tarballcli-hello-file)
* [`tarballcli help [COMMAND]`](#tarballcli-help-command)

## `tarballcli hello [FILE]`

Display basic message

```
USAGE
  $ tarballcli hello [FILE]

OPTIONS
  -f, --force
  -h, --help       show CLI help
  -n, --name=name  name to print

EXAMPLE
  $ tarballcli hello
```

_See code: [src/commands/hello.ts](https://github.com/VerasThiago/tarballcli/blob/v0.0.0/src/commands/hello.ts)_

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
<!-- commandsstop -->
