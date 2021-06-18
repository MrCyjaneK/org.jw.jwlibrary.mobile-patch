#!/bin/bash

sed -i 's/<data android:mimeType=".*\/.*"\/>/<data android:mimeType="dummy\/dummy"\/>/g' jwlibrary/AndroidManifest.xml