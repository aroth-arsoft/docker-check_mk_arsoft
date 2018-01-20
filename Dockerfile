# Dockerfile
FROM nlmacamp/check_mk:latest

# ARG can be overwritten on build time using "docker build --build-arg name=value"
ARG ARPY_VERSION="1.316"
ENV ARPY_VERSION=${ARPY_VERSION}

ADD install_arsoft-python.sh /opt
RUN /bin/bash -x /opt/install_arsoft-python.sh ${ARPY_VERSION}
