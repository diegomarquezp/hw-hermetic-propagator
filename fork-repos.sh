#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

pushd "${script_dir}"

for repo in $(cat "${script_dir}/repos"); do
  gh repo fork "googleapis/${repo}"
done

popd #script_dir
