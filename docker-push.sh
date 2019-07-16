#!/bin/bash

IMAGES=(php-5.6 php-7.1 php-7.2 php-7.3)
HUBUSER="cheppers"

echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

for i in "${IMAGES[@]}"; do
  echo "Building ${i}..."
  IMAGE=$(echo "${i}" | rev | cut -d'-' -f2- | rev)
  VERSION=$(echo "${i}" | rev | cut -d'-' -f1 | rev)
  docker build -t "${HUBUSER}/${IMAGE}:${VERSION}" "${i}"
  docker images
  echo "Pushing ${i} to ${HUBUSER}/${IMAGE}:${VERSION}..."
  docker push "${HUBUSER}/${IMAGE}:${VERSION}"
done
