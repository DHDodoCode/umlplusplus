# Filename: Dockerfile
# Description: Builds a copy of UML++'s CLI to run as a Docker image.

# -----------------------------------------------

# Stage 1: Use an Alpine image to build the code
FROM alpine:latest AS builder

# Set the working directory inside the container
WORKDIR /workspaces/umlplusplus

# Copy your C++ source files to the working directory
COPY . /workspaces/umlplusplus

# Acquire CMake in order to build program
RUN apk --no-cache add cmake clang clang-dev make gcc g++ libc-dev linux-headers

# Compile the C++ application
RUN cmake -B build
RUN cmake --build build --parallel

# -----------------------------------------------

# Stage 2: Use scratch as the base image
FROM alpine:latest

# Set working directory
WORKDIR /app

# Add shared libraries so code can use dynamic links
RUN apk --no-cache add libgcc libstdc++

# Copy the statically compiled binary from the builder stage
COPY --from=builder /workspaces/umlplusplus/build/project /app

# Expose 60555 for use in the GUI
EXPOSE 60555

# Run application once image is accessed
ENTRYPOINT ["./project", "--cli"]