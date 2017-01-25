#!/bin/bash
set -e

IMAGETAG=bitcoin-build
REVISION=${1:-master}
REPOSITORY=${2:-https://github.com/bitcoin/bitcoin.git}

docker build -t $IMAGETAG .
docker run -t -v $(pwd)/output:/output $IMAGETAG /bin/sh -c "\
    git clone $REPOSITORY bitcoin && \
    cd bitcoin/ && \
    git checkout $REVISION && \
    ./autogen.sh && \
    ./configure && \
    make && \
    cp ./src/bitcoind /output && \
    cp ./src/bitcoin-cli /output
"

