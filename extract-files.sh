#!/bin/sh

set -e

export DEVICE=jflte
export VENDOR=samsung
./../jf-common/extract-files.sh $@
