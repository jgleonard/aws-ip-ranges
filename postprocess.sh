#!/bin/bash

set -x
set -e
set -u
set -o pipefail

# install JQ to adjust the json
sudo apt-get install jq -y

# Remove token and creation date as they aren't loadable in flatgithub.com
jq 'del(.syncToken) | del(.createDate)' $1 > processed-$1
mv processed-$1 $1
