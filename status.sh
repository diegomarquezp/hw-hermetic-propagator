#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
target_dir="clients"

pushd "${script_dir}"
pushd "${target_dir}"

for repo in $(cat "${script_dir}/repos"); do
  pushd "${repo}"
  git status
  popd #repo
done

popd #target_dir
popd #script_dir
