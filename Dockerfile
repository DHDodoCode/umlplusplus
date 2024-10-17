# Docker file that runs UML++
# Run CLI or GUI based on the parameters given

FROM alpine:latest

ARG VIEW="CLI"
ENV VIEW=${VIEW}

WORKDIR /workspaces/umlplusplus

# Initial update runs
RUN apk update && \
    apk add --no-cache \
    bash \
    build-base \
    cmake \
    git

# Copy all repo files
COPY . /workspaces/umlplusplus

# Run bash script that runs based on argument given
COPY umlplusplus.sh .
RUN chmod +x umlplusplus.sh && ./umlplusplus.sh ${VIEW}