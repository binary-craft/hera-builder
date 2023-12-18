#!/usr/bin/env bash
# Custom script to install pack. Needed because buildpacks/github-actions/setup-pack does not properly support anything other than Linux.

set -eo pipefail

mkdir -p "${HOME}"/bin
echo "PATH=${HOME}/bin:${PATH}" >> "${GITHUB_ENV}"

if [ "$RUNNER_OS" == "macOS" ]; then
   PLATFORM="macos"
elif [ "$RUNNER_OS" == "Windows" ]; then
   PLATFORM="windows"
else
   PLATFORM="linux"
fi
if [ "$RUNNER_ARCH" == "ARM64" ]; then
   PLATFORM="${PLATFORM}-arm64"
fi

PACK_VERSION="0.32.1"
DOWNLOAD_URL="https://github.com/buildpacks/pack/releases/download/v${PACK_VERSION}/pack-v${PACK_VERSION}-${PLATFORM}.tgz"
echo "Installing pack ${PACK_VERSION} from ${DOWNLOAD_URL}"
curl \
  --show-error \
  --silent \
  --location \
  --fail \
  --retry 3 \
  --connect-timeout 5 \
  --max-time 60 \
  "${DOWNLOAD_URL}" \
| tar -C "${HOME}/bin" -xz pack

if [[ ! -f "${HOME}/bin/pack" ]]; then
   echo "Failed to install pack! Could not be found at ${HOME}/bin/pack"
   exit 1
fi

if [[ ! -x "${HOME}/bin/pack" ]]; then
   echo "Failed to install pack! Pack at ${HOME}/bin/pack is not executable"
   exit 2
fi
