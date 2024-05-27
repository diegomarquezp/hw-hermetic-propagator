#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
target_dir="clients"

pushd "${script_dir}"

if [[ -d "${target_dir}" ]]; then
  exit 0
fi

mkdir "${target_dir}"
pushd "${target_dir}"

for repo in $(cat "${script_dir}/repos"); do
  bash "${script_dir}/clone-repo.sh" "${repo}"
done

popd #target_dir
popd #script_dir
