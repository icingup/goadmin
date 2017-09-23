#! /usr/bin/env bash

MAIN_PK=thomas.com/app
TARGET_NAME=thomas
baseproj=$(cd "$(dirname "$0")"; pwd)

export GOPATH=${GOPATH}:${baseproj}

cd ${baseproj}
function build(){
	# cd ${baseproj}/bin
	# go build ${MAIN_PK}
	rm -rf ${baseproj}/bin/*
	go build -o  ${baseproj}/bin/${TARGET_NAME} ${MAIN_PK}
	cp -R ${baseproj}/src/template ${baseproj}/bin/template
	return 0;
}

function clean(){
	go clean -i ${TARGET_NAME} 
	rm -rf ${baseproj}/bin/*
	return 0;
}
function fmt(){
	go fmt ${MAIN_PK}
        # gofmt -w *.go 
	return 0;
}


function usage(){
        echo "make file is a tool for build/rebuild/fmt project.if u build/rebuild/fmt it,the location of object file will bee ${baseproj}/bin/${MAIN_PK}"
        echo ""
	echo "Usage:";
        echo ""
        echo -e "\t ${baseproj}/make.sh command"
        echo ""
        echo "The commands are:"
        echo ""
        echo -e "\t build \t\t compile project and dependencies"
        echo -e "\t clean \t\t remove object files"
	echo -e "\t fmt   \t\t format sources"
        echo ""
}

function main(){
	
        if [ "$1" = "build" ];then
		build
	elif [ "$1" = "clean" ];then
		clean
	elif [ "$1" = "fmt" ];then
		fmt
	else
		usage
	fi
	
}

main $1
