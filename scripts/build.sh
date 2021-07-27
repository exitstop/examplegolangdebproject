#!/bin/bash

#if [ -z $* ]
#then
    #echo "No options found!"
    #exit 1
#fi

#while getopts os:arch:tag:commit:projectname_log:build_time:product: option
while getopts ":a:b:c:d:e:f:g:" opt
do
case "${opt}" in
a) a=${OPTARG};;
b) b=${OPTARG};;
c) c=${OPTARG};;
d) d=${OPTARG};;
e) e=${OPTARG};;
f) f=${OPTARG};;
g) g=${OPTARG};;
*)
    ;;
esac
done

set -e

echo OS = ${a}
echo ARCH = ${b}
echo TAG = ${c}
echo COMMIT = ${d}
echo PROJECTNAME_LOG = ${e}
echo BUILD_TIME = ${f}
echo PRODUCT = ${g}

case ${g} in
     examplegolangdebproject)
        GOOS=${a} GOARCH=${b} go build \
            -ldflags="-X 'main.version=${c}' -X 'main.commit=${d}' -X 'main.buildTime=${f}'" \
            -o build/${e} cmd/${e}/main.go cmd/${e}/version.go
      ;;
     examplegolangdebproject2)
    echo examplegolangdebproject2
      ;;
     *)
esac
