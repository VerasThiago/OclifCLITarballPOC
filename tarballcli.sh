#!/usr/bin/env bash
set -e
echoerr() { echo "$@" 1>&2; }

get_script_dir () {
  SOURCE="${BASH_SOURCE[0]}"
  # While $SOURCE is a symlink, resolve it
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$( readlink "$SOURCE" )"
    # If $SOURCE was a relative symlink (so no "/" as prefix, need to resolve it relative to the symlink base directory
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  echo "$DIR"
}
DIR=$(get_script_dir)

echo "DIR = $DIR"
CLI_HOME=$(cd && pwd)
echo "CLI_HOME = $CLI_HOME"
XDG_DATA_HOME=${XDG_DATA_HOME:="$CLI_HOME/.local/share"}
echo "XDG_DATA_HOME = $XDG_DATA_HOME"
CLIENT_HOME=${TARBALLCLI_OCLIF_CLIENT_HOME:=$XDG_DATA_HOME/tarballcli/client}
echo "CLIENT_HOME = $CLIENT_HOME"
BIN_PATH="$CLIENT_HOME/bin/tarballcli"
echo "BIN_PATH = $BIN_PATH"

if [ -z "$TARBALLCLI_REDIRECTED" ] && [ -x "$BIN_PATH" ] && [[ ! "$DIR/tarballcli" -ef "$BIN_PATH" ]]; then
  if [ "$DEBUG" == "*" ]; then
    echoerr "$BIN_PATH" "$@"
  fi
  TARBALLCLI_BINPATH="$BIN_PATH" TARBALLCLI_REDIRECTED=1 "$BIN_PATH" "$@"
else
  export TARBALLCLI_BINPATH=${TARBALLCLI_BINPATH:="$DIR/tarballcli"}
  if [ -x "$(command -v "$XDG_DATA_HOME/oclif/node/node-custom")" ]; then
    NODE="$XDG_DATA_HOME/oclif/node/node-custom"
  elif [ -x "$(command -v "$DIR/node")" ]; then
    NODE="$DIR/node"
  elif [ -x "$(command -v "$XDG_DATA_HOME/oclif/node/node-12.12.0")" ]; then
    NODE="$XDG_DATA_HOME/oclif/node/node-12.12.0"
  elif [ -x "$(command -v node)" ]; then
    NODE=node
  else
    echoerr 'Error: node is not installed.' >&2
    exit 1
  fi
  if [ "$DEBUG" == "*" ]; then
    echoerr TARBALLCLI_BINPATH="$TARBALLCLI_BINPATH" "$NODE" "$DIR/run" "$@"
  fi
  echo "Cheguei aqui e vou rodar NODE = $NODE e DIR = $DIR e um /run e depois @ $@"
  "$NODE" "$DIR/run" "$@"
fi
