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

# Run ctest to perform all tests
# RUN ctest -C Release --test-dir ./build

# Run gcov to acquire code coverage 
# RUN gcov /workspaces/umlplusplus/build/CMakeFiles/umllib.dir/umllib/*.o