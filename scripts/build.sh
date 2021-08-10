#!/bin/bash

#if [ -z $* ]
#then
    #echo "No options found!"
    #exit 1
#fi

#while getopts os:arch:tag:commit:projectname_log:build_time:product: option
while getopts ":a:b:c:d:e:f:g:h:k:" opt
do
case "${opt}" in
a) a=${OPTARG};;
b) b=${OPTARG};;
c) c=${OPTARG};;
d) d=${OPTARG};;
e) e=${OPTARG};;
f) f=${OPTARG};;
g) g=${OPTARG};;
h) h=${OPTARG};;
k) currs+=("$OPTARG");;
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
echo FULL_SCREEN = ${h}

for cur in "${currs[@]}"; do
    echo "-k $cur"
done

if [ "$ARCH" = "arm64" ]; then
    CGO_ENABLED=1
    CC=/usr/bin/aarch64-linux-gnu-gcc
    echo cross compile! CGO_ENABLED=$CGO_ENABLED CC_FOR_TARGET=$CC
fi

CGO_ENABLED=$CGO_ENABLED CC=$CC GOOS=${a} GOARCH=${b} go build \
    -ldflags="-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Version=${c}' \
    -X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Commit=${d}' \
    -X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.BuildTime=${f}' \
    -X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.AppName=${e}' \
    -X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Version=${c}' \
    -X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.FullScreenString=${h}'" \
    -o build/${e} ${currs[@]}
    #-o build/${e} cmd/${e}/main.go cmd/${e}/version.go ${currs[@]}

exit 0

# Если нужно делать различие при сборке
#case ${g} in
     #examplegolangdebproject)
        #GOOS=${a} GOARCH=${b} go build \
            #-ldflags="-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Version=${c}' \
                #-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Commit=${d}' \
                #-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.BuildTime=${f}' \
                #-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Version=${c}'" \
            #-o build/${e} cmd/${e}/main.go cmd/${e}/version.go
      #;;
     #server_sh)
        #GOOS=${a} GOARCH=${b} go build \
            #-ldflags="-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Version=${c}' \
                #-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Commit=${d}' \
                #-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.BuildTime=${f}' \
                #-X 'github.com/FaceChainTeam/examplegolangdebproject/internal/app.Version=${c}'" \
            #-o build/${e} cmd/${e}/main.go cmd/${e}/version.go
      #;;
     #*)
#esac
