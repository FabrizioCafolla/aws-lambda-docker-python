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
  local _data=${1:-"{}"}
  
  curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d ${_data}
}

main "$@"