#!/bin/bash
set -ex
repo_name=$1

if [[ -z "${GH_TOKEN}" ]]; then
	echo "GH_TOKEN must be available in the environment when running this script"
	exit 1
fi

git clone "https://${GH_TOKEN}@github.com/diegomarquezp/${repo_name}"
