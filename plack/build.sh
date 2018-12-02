#!/bin/bash

set -ue

if [ -z "$BASE_DIR" ]; then
  echo "[ERROR] \$BASE_DIR must be set, but that is empty"
  exit 1
fi

if [ -z "$PERL_VERSION" ]; then
  echo "[ERROR] \$PERL_VERSION must be set, but that is empty"
  exit 1
fi

yum install -y zip

# build perl
if [ -f "$BASE_DIR/perl-${PERL_VERSION}.tar.gz" ]; then
  curl -L https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - "$BASE_DIR/perl-${PERL_VERSION}.tar.gz" /opt/
else
  curl -L https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - "$PERL_VERSION" /opt/
fi

# setup tool-chain
curl -L https://cpanmin.us | /opt/bin/perl - App::cpanminus
/opt/bin/cpanm -n Carton

# install deps
cd "$BASE_DIR"
/opt/bin/carton install

# packing
zip -r "${BASE_DIR}/func.zip" .

