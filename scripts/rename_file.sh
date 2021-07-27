#!/bin/bash

CURRENT_NAME=$1
NEW_NAME=$2

set -ex

mv configs/$CURRENT_NAME.example.toml configs/$NEW_NAME.example.toml
mv cmd/$CURRENT_NAME cmd/$NEW_NAME
cd debian
mv $CURRENT_NAME.install $NEW_NAME.install
mv $CURRENT_NAME.logrotate $NEW_NAME.logrotate
mv $CURRENT_NAME.$CURRENT_NAME.service $NEW_NAME.$NEW_NAME.service
mv $CURRENT_NAME.post $NEW_NAME.post
mv $CURRENT_NAME.service $NEW_NAME.service
mv $CURRENT_NAME.postrm.debhelper $NEW_NAME.postrm.debhelper
mv $CURRENT_NAME.substvars $NEW_NAME.substvars
