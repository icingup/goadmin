#! /usr/bin/env bash

gh=${GOPATH}
baseproj=$(cd "$(dirname "$0")"; pwd)
export GOPATH=${baseproj}

go get -u github.com/julienschmidt/httprouter

export GOPATH=$gh

