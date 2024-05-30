#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

pushd "${script_dir}"

for repo in $(cat "${script_dir}/repos"); do
  pushd clients/${repo}
  gh pr create \
    --draft \
    --repo googleapis/${repo} \
    --head diegomarquezp:main \
    --base main \
    --title 'feat: enable hermetic library generation' \
    --body ''
  popd

done

popd #script_dir
