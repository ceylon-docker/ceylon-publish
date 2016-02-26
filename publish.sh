#!/bin/bash

set -e

if [[ $# -ne 4 ]]; then
    echo "Usage: docker run ceylon/ceylon-publish <version> <herd_url> <user> <password>"
    exit
fi

PUBLISH_VERSION=$1
HERD_REPO=$2
HERD_USER=$3
HERD_PASS=$4

if [[ -f /output/.novolume ]]; then
    echo "Missing -v /your/output/path:/output argument to docker"
    exit
fi

unzip /output/ceylon-${PUBLISH_VERSION}.zip

MODULES=$(find ceylon-${PUBLISH_VERSION}/repo -name '*.[cj]ar' -printf "%P\n" | sed -r 's/^(.*)\/([^\/]*)\/[^\/]*/\1$\2/' | tr "/$" "./")

echo ""
echo "Found the following modules: ${MODULES}"
echo ""

ceylon copy \
    --no-default-repositories \
    --offline \
    --rep ceylon-${PUBLISH_VERSION}/repo \
    --out "${HERD_REPO}" \
    --user "${HERD_USER}" \
    --pass "${HERD_PASS}" \
    --all \
    ${MODULES}

