#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
target_dir="clients"
repo=$1

if [[ -z "${repo}" ]]; then
  echo 'usage: bash run-workflow.sh [repo]'
  exit 1
fi

pushd "${script_dir}"
pushd "${target_dir}"
pushd "${repo}"

gh workflow run "update_googleapis_committish.yaml"

popd #repo
popd #target_dir
popd #script_dir
