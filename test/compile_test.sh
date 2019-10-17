#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile() {
  loadFixture "Aptfile"

  compile

  assertCapturedSuccess

  assertCaptured "Fetching .debs for s3cmd"
  assertCaptured "Installing s3cmd_"
  assertCaptured "Fetching .debs for wget"
  assertCaptured "Installing wget_"
}

testStackChange() {
  loadFixture "Aptfile"

  #Set the cached STACK value to a non-existent stack, so it is guaranteed to change.
  mkdir -p "$CACHE_DIR/.apt/"
  echo "cedar-10" > "$CACHE_DIR/.apt/STACK"
  
  #Load the Aptfile into the cache, to exclusively test the stack changes
  mkdir -p "$CACHE_DIR/apt/cache"
  cp $BUILD_DIR/Aptfile "$CACHE_DIR/apt/cache"

  compile

  assertCapturedSuccess

  assertCaptured "Detected Aptfile or Stack changes, flushing cache"
}

testStackNoChange() {
  loadFixture "Aptfile"

  #Load the Aptfile into the cache, to exclusively test the stack changes
  mkdir -p "$CACHE_DIR/apt/cache"
  cp $BUILD_DIR/Aptfile "$CACHE_DIR/apt/cache"

  compile

  assertCaptured "Reusing cache"
}

testStackCached() {
  loadFixture "Aptfile"

  compile
  assertCapturedSuccess

  assertTrue 'STACK not cached' "[ -e $CACHE_DIR/.apt/STACK ]"
}

loadFixture() {
  cp -a $BUILDPACK_HOME/test/fixtures/$1/. ${BUILD_DIR}
}