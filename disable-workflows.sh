#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
target_dir="clients"

pushd "${script_dir}"
pushd "${target_dir}"

for repo in $(cat "${script_dir}/repos"); do
  pushd "${repo}"
  pushd ".github/workflows"
  for workflow in $(ls); do
    if [[ "${workflow}" == "update_googleapis_committish.yaml" ]] || [[ "${workflow}" == "hermetic_library_generation.yaml" ]]; then
      continue
    fi
    set +e
    gh workflow disable "${workflow}"
    set -e
  done
  popd #.github/workflows
  popd #repo
done

popd #target_dir
popd #script_dir
