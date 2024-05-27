#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
target_dir="clients"
target_files=(
  ".github/workflows/hermetic_library_generation.yaml"
  ".github/workflows/update_googleapis_committish.yaml"
  "generation/hermetic_library_generation.sh"
  "generation/update_googleapis_committish.sh"
)

pushd "${script_dir}"
pushd "${target_dir}"

for repo in $(cat "${script_dir}/repos"); do
  pushd "${repo}"
  if [[ -f ".github/.OwlBot.yaml" ]]; then
    mv ".github/.OwlBot.yaml" ".github/.OwlBot-hermetic.yaml"
  fi
  for target_file in "${target_files[@]}"; do
    if [[ -f "${target_file}" ]]; then
      rm "${target_file}"
    fi
    mkdir -p $(dirname "${target_file}")
    cp "${script_dir}/java-bigtable/${target_file}" "${target_file}"
  done
  if [[ -f "generation_config.yaml" ]]; then
    rm "generation_config.yaml"
  fi
  cp "${script_dir}/configs/${repo}" "generation_config.yaml"
  popd #repo
done

popd #target_dir
popd #script_dir
