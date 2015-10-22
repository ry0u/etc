proxy="http://j114126:UQYgR0#o@cache.ccs.kogakuin.ac.jp:8080"
switch_flag="AP-TUT"

function change() {
    export http_proxy=$proxy
    export HTTP_PROXY=$proxy
    export https_proxy=$proxy
    export HTTPS_PROXY=$proxy

    git config --global http.proxy $proxy
    git config --global https.proxy $proxy
}

function default() {
    unset http_proxy
    unset HTTP_PROX
    unset https_proxy
    unset HTTPS_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

