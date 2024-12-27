# Filename: Dockerfile
# Description: Builds a copy of UML++ within a Docker image.

# -----------------------------------------------

# Stage 1: Use an Alpine image to build the code
FROM alpine:latest AS builder

# Set the working directory inside the container
WORKDIR /workspaces/umlplusplus

# Copy C++ source files to the working directory
COPY . /workspaces/umlplusplus

# Acquire CMake in order to build program
RUN apk --no-cache add cmake clang clang-dev make gcc g++ libc-dev linux-headers

# Compile the C++ application
RUN cmake -B build
RUN cmake --build build --parallel