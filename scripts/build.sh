#!/bin/bash

while getopts os:arch:tag:commit:projectname_log:build_time:product: option
do
case "${option}"
in
os) OS=${OPTARG};;
arch) arch=${OPTARG};;
tag) TAG=${OPTARG};;
commit) COMMIT=${OPTARG};;
projectname_log) COMMIT=${PROJECTNAME_LOG};;
build_time) COMMIT=${BUILD_TIME};;
product) COMMIT=${PRODUCT};;
esac
done


set -e

echo OS = ${OS}
echo ARCH = ${ARCH}
echo TAG = ${TAG}
echo COMMIT = ${COMMIT}
echo PROJECTNAME_LOG = ${PROJECTNAME_LOG}
echo BUILD_TIME = ${BUILD_TIME}
echo PRODUCT = ${PRODUCT}

case ${PRODUCT} in
     examplegolangdebproject)
        GOOS=${OS} GOARCH=${ARCH} go build \
            -ldflags="-X 'main.version=${TAG}' -X 'main.commit=${COMMIT}' -X 'main.buildTime=${BUILD_TIME}'" \
            -o build/${PROJECTNAME_LOG} cmd/examplegolangdebproject/main.go cmd/examplegolangdebproject/version.go
      ;;
     examplegolangdebproject2)
    echo examplegolangdebproject2
      ;;
     *)
esac

echo end
