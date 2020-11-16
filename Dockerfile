FROM sonarsource/sonar-scanner-cli:4.5

ARG SONAR_SCANNER_HOME=/opt/sonar-scanner
ARG NODEJS_HOME=/opt/nodejs
ARG BUILD_WRAPPER_HOME=/opt/build-wrapper-linux-x86

ENV PATH=${PATH}:${SONAR_SCANNER_HOME}/bin:${NODEJS_HOME}/bin:${BUILD_WRAPPER_HOME}


WORKDIR /opt

USER root

COPY build-wrapper-linux-x86 ./build-wrapper-linux-x86
COPY entrypoint.sh /entrypoint.sh

# RUN apk add gcc g++ make libffi-dev openssl-dev libtool cmake \
    # && chmod +x /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
