#!/bin/sh -l

if [[ -z "${SONAR_TOKEN}" ]]; then
  echo "Set the SONAR_TOKEN env variable."
  exit 1
fi

if [[ -z "${SONARCLOUD_URL}" ]]; then
  SONARCLOUD_URL="https://sonarcloud.io"
fi

echo $PATH
build-wrapper-linux-x86-64 --out-dir ${BUILD_WRAPPER_OUTPUT_DIR} ${INPUT_BUILDCOMMAND}

#sonar-scanner -Dsonar.projectBaseDir=${POROJECT_ROOT_DIR} -Dsonar.host.url=${SONARCLOUD_URL} ${INPUT_ARGS}
