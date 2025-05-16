#!/usr/bin/bash

if [[ -z "$PG_CONFIG" ]]; then
    echo "PG_CONFIG is not set"
    exit 1
fi
export PG_CONFIG="$(cygpath -u "$PG_CONFIG")"

curdir="$(cd "$(dirname "$0")"; pwd)"
srcdir="$(find "$curdir" -maxdepth 1 -type d -name "pgmq-extension*" | sort -r | head -n 1)"
pushd "$srcdir"

echo $PWD
make
make install

popd
