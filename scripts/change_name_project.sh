#!/bin/bash

CURRENT_NAME=$1
NAME=$2

a=$CURRENT_NAME;b=$NAME&& grep -l "$a" `find  -type f \( -name "*.toml" \
    -o -name "*.go" \
    -o -name "*.mod" \
    -o -name "*.sh" \
    -o -name ".gitignore" \
    -o -name "rules" \
    -o -name "postinst" \
    -o -name "control" \
    -o -name "changelog" \
    -o -name "desc.json" \
    -o -name "preinst" \
    -o -name "*.post" \
    -o -name "*.debhelper" \
    -o -name "*.install" \
    -o -name "Makefile" \
    -o -name "*.service" \
    -o -name "*.logrotate" \
    \)` | xargs sed -i "s/$a/$b/g"
