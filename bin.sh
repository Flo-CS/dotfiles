#!/usr/bin/env bash

set -euo pipefail

. dots-env-check-set

sudo cp -r $DOTS_DIR/bin/* /usr/local/bin
