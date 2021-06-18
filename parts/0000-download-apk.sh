#!/bin/sh

VERSION="$(curl --silent 'https://b.jw-cdn.org/apis/pub-media/GETPUBMEDIALINKS?output=json&pub=jwlb&fileformat=APK&alllangs=0&langwritten=E&txtCMSLang=E' | tr "," "\n" | grep modifiedDatetime)"
CUR_VERSION=$(cat ./VERSION.txt || true)

if [[ "X$CUR_VERSION" == "X$VERSION" ]];
then
    echo "No need to update - we have latest apk"
else
    echo "Updating apk..."
    rm jwlibrary.apk || true
    wget -O jwlibrary.apk $(curl --silent 'https://b.jw-cdn.org/apis/pub-media/GETPUBMEDIALINKS?output=json&pub=jwlb&fileformat=APK&alllangs=0&langwritten=E&txtCMSLang=E' | tr '"' "\n" | grep ".apk" | head -1)
    echo "$VERSION" > VERSION.txt
fi