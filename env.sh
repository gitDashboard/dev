#!/bin/bash
godir=$(dirname  $(readlink -f  $BASH_SOURCE))
echo $godir
export GOROOT=/opt/go
export GOPATH=$godir
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$godir/bin
