#!/bin/bash

set -x
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

latest=$(get_latest_release "Creepsky/creepMiner")

git clone https://github.com/Creepsky/creepMiner.git
cd creepMiner
git checkout $latest

