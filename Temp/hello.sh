#! /bin/zsh

proxy="http://j114126:UQYgR0#o@cache.ccs.kogakuin.ac.jp:8080"
switch_flag="AP-TUT"

function set_proxy() {
  export http_proxy=$proxy
  export HTTP_PROXY=$proxy
  export ftp_proxy=$proxy
  export FTP_PROXY=$proxy
  export all_proxy=$proxy
  export ALL_PROXY=$proxy
  export https_proxy=$proxy
  export HTTPS_PROXY=$proxy

  git config --global http.proxy $proxy
  git config --global https.proxy $proxy
}

function unset_proxy() {
    unset http_proxy
    unset HTTP_PROX
    unset ftp_proxy
    unset FTP_PROXY
    unset all_proxy
    unset ALL_PROXY
    unset https_proxy
    unset HTTPS_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy
}


if iwconfig wlan0 | grep "$switch_flag" ; then
    set_proxy
    echo "proxy set"
else
    unset_proxy
    echo "proxy unset"
fi

