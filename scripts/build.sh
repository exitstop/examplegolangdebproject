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

GOOS=${a} GOARCH=${b} go build \
    -ldflags="-X 'github.com/exitstop/examplegolangdebproject/internal/app.Version=${c}' \
    -X 'github.com/exitstop/examplegolangdebproject/internal/app.Commit=${d}' \
    -X 'github.com/exitstop/examplegolangdebproject/internal/app.BuildTime=${f}' \
    -X 'github.com/exitstop/examplegolangdebproject/internal/app.AppName=${e}' \
    -X 'github.com/exitstop/examplegolangdebproject/internal/app.Version=${c}'" \
    -o build/${e} cmd/${e}/main.go cmd/${e}/version.go

exit 0

# Если нужно делать различие при сборке
#case ${g} in
     #examplegolangdebproject)
        #GOOS=${a} GOARCH=${b} go build \
            #-ldflags="-X 'github.com/exitstop/examplegolangdebproject/internal/app.Version=${c}' \
                #-X 'github.com/exitstop/examplegolangdebproject/internal/app.Commit=${d}' \
                #-X 'github.com/exitstop/examplegolangdebproject/internal/app.BuildTime=${f}' \
                #-X 'github.com/exitstop/examplegolangdebproject/internal/app.Version=${c}'" \
            #-o build/${e} cmd/${e}/main.go cmd/${e}/version.go
      #;;
     #examplegolangdebproject2)
        #GOOS=${a} GOARCH=${b} go build \
            #-ldflags="-X 'github.com/exitstop/examplegolangdebproject/internal/app.Version=${c}' \
                #-X 'github.com/exitstop/examplegolangdebproject/internal/app.Commit=${d}' \
                #-X 'github.com/exitstop/examplegolangdebproject/internal/app.BuildTime=${f}' \
                #-X 'github.com/exitstop/examplegolangdebproject/internal/app.Version=${c}'" \
            #-o build/${e} cmd/${e}/main.go cmd/${e}/version.go
      #;;
     #*)
#esac
