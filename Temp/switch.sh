#! /bin/zsh

proxy="proxy"
switch_flag="学内LANのSSID"

function change() {
  export http_proxy=$proxy
  export https_proxy=$proxy
  export HTTP_PROXY=$proxy
  export HTTPS_PROXY=$proxy

  git config --global http.proxy $proxy
  git config --global https.proxy $proxy
}

function default() {
    unset http_proxy
    unset https_proxy
    unset HTTP_PROX
    unset HTTPS_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

if iwconfig wlan0 | grep "$switch_flag" ; then
    change
    echo "proxy change"
else
    default
    echo "proxy default"
fi

