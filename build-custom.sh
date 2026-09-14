#!/bin/sh
set -eu
git clone --depth 1 --branch v25.3.6 https://github.com/XrayR-project/XrayR.git src
git -C src apply ../panel-fragment-fix.patch
cd src
go test ./panel
CGO_ENABLED=0 go build -trimpath -ldflags '-s -w -buildid=' -o ../XrayR-v25.3.6-custom
cd ..
sha256sum XrayR-v25.3.6-custom > XrayR-v25.3.6-custom.sha256
