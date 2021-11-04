#!/bin/bash
set -eE -o functrace

failure() {
  local lineno=$1
  local msg=$2
  echo "Failed at $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

set -o pipefail

main(){
    docker build -t lambda-sample .
    docker run -it -p 9000:8080 --name=lambda-sample lambda-sample
    docker rm -f lambda-sample
}

main "$@"