#!/bin/bash

set -ue

# install deps
cd "$BASE_DIR" || exit 1
/opt/bin/carton install

# packing
zip -r "${BASE_DIR}/func.zip" .

