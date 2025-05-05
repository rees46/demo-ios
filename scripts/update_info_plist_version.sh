#!/bin/bash

source ./version.properties
INFO_PLIST_PATH="./Info.plist"

/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${VERSION_NAME}" "$INFO_PLIST_PATH"
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion ${VERSION_CODE}" "$INFO_PLIST_PATH"

echo "Updated iOS: CFBundleShortVersionString=${VERSION_NAME}, CFBundleVersion=${VERSION_CODE}"
