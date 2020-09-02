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
        echoerr "Your path is missing /usr/local/bin, you need to add this to use this installer."
        exit 1
    fi

    if [ "\$(uname)" == "Darwin" ]; then
        OS=darwin
    elif [ "\$(expr substr \$(uname -s) 1 5)" == "Linux" ]; then
        OS=linux
    else
        echoerr "This installer is only supported on Linux and MacOS"
        exit 1
    fi

    ARCH="\$(uname -m)"
    if [ "\$ARCH" == "x86_64" ]; then
        ARCH=x64
    elif [[ "\$ARCH" == arm* ]]; then
        ARCH=arm
    else
        echoerr "unsupported arch: \$ARCH"
        exit 1
    fi
        
    mkdir -p /usr/local/lib
    cd /usr/local/lib
    rm -rf tarball
    rm -rf ~/.local/share/tarball/client

    if [ \$(command -v xz) ]; then
        URL=https://vtex-toolbelt-test.s3.us-east-2.amazonaws.com/tarballcli-\$OS-\$ARCH.tar.xz
        TAR_ARGS="xJ"
    else
        URL=https://vtex-toolbelt-test.s3.us-east-2.amazonaws.com/tarballcli-\$OS-\$ARCH.tar.gz
        TAR_ARGS="xz"
    fi
    
    echo "Installing VTEX from \$URL"
    
    if [ \$(command -v curl) ]; then
        curl "\$URL" | tar "\$TAR_ARGS"
    else
        wget -O- "\$URL" | tar "\$TAR_ARGS"
    fi
    
    # delete old toolbelt bin if exists
    rm -f \$(command -v tarballcli) || true
    rm -f /usr/local/bin/tarballcli
    ln -s /usr/local/lib/tarballcli/bin/tarballcli /usr/local/bin/tarballcli

    # on alpine (and maybe others) the basic node binary does not work
    # remove our node binary and fall back to whatever node is on the PATH
    /usr/local/lib/tarballcli/bin/node -v || rm /usr/local/lib/tarballcli/bin/node

SCRIPT
  # test the CLI
  LOCATION=$(command -v tarballcli)
  echo "tarballcli installed to $LOCATION"
  tarballcli version
}