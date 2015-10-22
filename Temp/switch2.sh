#! /bin/zsh

# proxy="http://j114126:UQYgR0#o@cache.ccs.kogakuin.ac.jp:8080"
proxy="http://cache.ccs.kogakuin.ac.jp:8080"
proxy2="http://cache.ccs.kogakuin.ac.jp:8080"
switch_flag="AP-TUT"

function change() {
  export http_proxy=$proxy
  export https_proxy=$proxy
  export HTTP_PROXY=$proxy
  export HTTPS_PROXY=$proxy
  export all_proxy=$proxy
  export ALL_PROXY=$proxy

  git config --global http.proxy $proxy2
  git config --global https.proxy $proxy2
}

function default() {
    unset http_proxy
    unset https_proxy
    unset HTTP_PROX
    unset HTTPS_PROXY
    unset all_proxy
    unset ALL_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy
}


if iwconfig wlan0 | grep "$switch_flag" ; then
    change
    echo "proxy set"
else
    default
    echo "proxy unset"
fi

