#!/bin/bash -eux

DOCKERHUB_USERNAME=${1:-"ncbi"}
IMAGE=blast
VERSION=`curl -s https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/VERSION`
# Check the latest ncbi-vdb release version in https://github.com/ncbi/ncbi-vdb/tags
NP=`grep -c ^proc /proc/cpuinfo`

docker build --build-arg version=${VERSION} --build-arg num_procs=${NP} -t $DOCKERHUB_USERNAME/$IMAGE:$VERSION .
docker tag $DOCKERHUB_USERNAME/$IMAGE:$VERSION $DOCKERHUB_USERNAME/$IMAGE:latest
