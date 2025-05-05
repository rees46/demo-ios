#!/bin/bash

source ./version.properties
INFO_PLIST_PATH="./Info.plist"

sed -i '/<key>CFBundleVersion<\/key>/{n;s/<string>.*<\/string>/<string>'"$VERSION_CODE"'<\/string>/}' "$INFO_PLIST_PATH"
sed -i '/<key>CFBundleShortVersionString<\/key>/{n;s/<string>.*<\/string>/<string>'"$VERSION_NAME"'<\/string>/}' "$INFO_PLIST_PATH"

echo "Updated iOS: CFBundleShortVersionString=${VERSION_NAME}, CFBundleVersion=${VERSION_CODE}"
