#!/bin/bash
{
    set -e
    SUDO=''
    if [ "$(id -u)" != "0" ]; then
      SUDO='sudo'
      echo "This script requires superuser access."
      echo "You will be prompted for your password by sudo."
      # clear any previous sudo permission
      sudo -k
    fi


    # run inside sudo
    $SUDO bash <<SCRIPT
    set -e

    echoerr() { echo "\$@" 1>&2; }

    if [[ ! ":\$PATH:" == *":/usr/local/bin:"* ]]; then
        echoerr "You don't have /usr/local/bin path. So your CLI are not installed"
        exit 1
    fi

    echo "Uninstalling VTEX"

    echo "removing /usr/local/bin/tarballcli ..."
    rm -rf /usr/local/bin/tarballcli
    echo "removing command -v tarballcli ..."
    rm -f \$(command -v tarballcli) || true
    echo "removing ~/.local/share/tarballcli ..."
    rm -rf ~/.local/share/tarballcli
    echo "removing /usr/local/lib/tarballcli ..."
    rm -rf /usr/local/lib/tarballcli
    
SCRIPT
    echo "VTEX Uninstalled"
}