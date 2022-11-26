#!/bin/bash

# docker login
docker login
docker run --privileged --rm docker/binfmt:a7996909642ee92942dcd6cff44b9b95f08dad64

# Update sourcecode
svn up trunk
VERSION=`svnversion -n trunk`
echo "Building $VERSION"

# latest - version
docker buildx build --platform linux/amd64,linux/arm64 --push -t jamal919/xbeach:r${VERSION} .
docker buildx build --load -t jamal919/xbeach:r${VERSION} .

# latest - latest
docker buildx build --platform linux/amd64,linux/arm64 --push -t jamal919/xbeach:latest .
docker buildx build --load -t jamal919/xbeach:latest .
