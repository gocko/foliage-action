# Download Pharo Image in a clean image
#FROM alpine:3
FROM ubuntu:22.04
MAINTAINER Esteban Lorenzano <esteban@lorenzano.eu>
#RUN apk add unzip bash
RUN apt-get update && apt-get install unzip

# add user
#RUN adduser -D foliage
RUN useradd -ms /bin/bash foliage

# install vm
USER root
WORKDIR /opt/pharo
#ADD http://files.pharo.org/get-files/100/pharo-vm-Linux-x86_64-stable.zip ./vm.zip
ADD https://files.pharo.org/vm/pharo-spur64-headless/Linux-x86_64/PharoVM-9.0.14-93600e1-Linux-x86_64-bin.zip ./vm.zip
RUN set -eu; \
  unzip vm.zip; \
  rm vm.zip; \
  true
# install image
WORKDIR /home/foliage
ADD http://files.pharo.org/get-files/100/pharoImage-x86_64.zip ./pharo64.zip
COPY foliage.sh ./run
RUN set -eu; \
  unzip pharo64.zip; \
  rm pharo64.zip; \
  mv *.image foliage.image; \
  mv *.changes foliage.changes; \
  chmod +x foliage; \
  chown -R foliage.foliage *; \
  true
USER foliage
# install foliage
COPY build.st ./build.st
RUN /opt/pharo/pharo ./foliage.image st --save --quit build.st; \
  rm build.st; \
  true
# set 
ENTRYPOINT [ "/home/foliage/run" ]
