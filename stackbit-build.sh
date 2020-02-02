#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e36919b1bed2b001beb1990/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e36919b1bed2b001beb1990
curl -s -X POST https://api.stackbit.com/project/5e36919b1bed2b001beb1990/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e36919b1bed2b001beb1990/webhook/build/publish > /dev/null
