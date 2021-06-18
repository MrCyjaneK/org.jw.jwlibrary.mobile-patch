#!/bin/bash
echo "building"

apktool b jwlibrary

# Generate key:

if [[ ! -f "my-release-key.keystore" ]];
then
    echo -n -e "123456\n123456\nCzarek Nakamoto\nnone\nMrCyjaneK\nnowhere\nnowhere\nXD\nyes\n" | keytool -genkey -v -keystore my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
fi
echo -n -e "123456\n" | jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore jwlibrary/dist/jwlibrary.apk alias_name