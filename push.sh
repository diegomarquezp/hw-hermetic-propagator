#!/bin/bash
#!/bin/bash
set -ex
script_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
target_dir="clients"
message=$1

if [[ -z "${message}" ]]; then
  echo "usage: bash push.sh [commit message]"
  exit 1
fi

pushd "${script_dir}"
pushd "${target_dir}"

for repo in $(cat "${script_dir}/repos"); do
  pushd "${repo}"
  if [[ -n $(git diff --shortstat) ]]; then
    git add .
    git commit -m "${message}"
    git push
  fi
  popd #repo
done

popd #target_dir
popd #script_dir
