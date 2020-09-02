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
    rm -rf /usr/local/bin/tarball
    rm -f \$(command -v tarballcli) || true
    rm -rf ~/.local/share/tarball/client
    rm -rf /usr/local/lib/tarball
    
SCRIPT
    echo "VTEX Uninstalled"
}