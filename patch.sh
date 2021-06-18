#!/bin/bash
# Prepare env
mkdir workdir
cd workdir

. ../parts/0000-download-apk.sh
. ../parts/0010-decompile-apk.sh
. ../parts/1000-patch-handlers.sh
. ../parts/9980-remove-invalid.sh
. ../parts/9990-build-sign.sh