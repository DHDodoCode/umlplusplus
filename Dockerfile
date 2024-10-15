# Docker file that runs UML++
# Run CLI or GUI based on the parameters given

FROM alpine:latest

ARG VIEW=CLI
ENV VIEW ${VAR}

WORKDIR /workspaces/umlplusplus

# Initial update runs
RUN apk update && \
    apk add --no-cache \
    bash \
    build-base \
    cmake 

# Run bash script that runs based on argument given
COPY umlplusplus.sh .
RUN umlplusplus.sh ${VIEW}

