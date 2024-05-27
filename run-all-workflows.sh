#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

pushd "${script_dir}"

for repo in $(cat "${script_dir}/repos"); do
  bash "${script_dir}/run-workflow.sh" "${repo}"
done

popd #script_dir
