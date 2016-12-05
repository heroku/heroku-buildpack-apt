#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile() {
  cat > ${BUILD_DIR}/Aptfile <<EOF
s3cmd
wget
https://packagecloud.io/heroku/open/packages/ubuntu/trusty/json2envdir_2.1.1_amd64.deb/download
EOF

  compile

  assertCapturedSuccess

  assertCaptured "Fetching .debs for s3cmd"
  assertCaptured "Installing s3cmd_"
  assertCaptured "Fetching .debs for wget"
  assertCaptured "Installing wget_"
  assertCaptured "Fetching https://packagecloud.io/heroku/open/packages/ubuntu/trusty/json2envdir_2.1.1_amd64.deb/download"
  assertCaptured "Installing json2envdir_2.1.1"
}
