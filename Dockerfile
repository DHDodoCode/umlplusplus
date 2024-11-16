# Filename: Dockerfile
# Description: Builds a copy of UML++'s CLI to run as a Docker image.

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
RUN ctest -C Release --test-dir ./build

# Run gcov to acquire code coverage 
RUN gcov /workspaces/umlplusplus/build/CMakeFiles/umllib.dir/umllib/*.o

# -----------------------------------------------

# Stage 2: Create image 
FROM alpine:latest

# Set working directory
WORKDIR /app

# Add shared libraries so code can use dynamic links
RUN apk --no-cache add libgcc libstdc++

# Copy the statically compiled binary from the builder stage
COPY --from=builder /workspaces/umlplusplus/build/project /app

# Copy the tests so that they can be ran in the workflow
COPY --from=builder /workspaces/umlplusplus/build/Tests /app

# Copy code coverage to upload to codecov
COPY --from=builder /workspaces/umlplusplus/UMLClass.cpp.gcov \
                    /workspaces/umlplusplus/UMLRelationship.cpp.gcov \
                    /workspaces/umlplusplus/UMLAttribute.cpp.gcov \
                    /workspaces/umlplusplus/UMLField.cpp.gcov \
                    /workspaces/umlplusplus/UMLMethod.cpp.gcov \
                    /workspaces/umlplusplus/UMLParameter.cpp.gcov \
                    /workspaces/umlplusplus/UMLData.cpp.gcov \
                    /workspaces/umlplusplus/UMLDataHistory.cpp.gcov \
                    /workspaces/umlplusplus/UMLFile.cpp.gcov \
                    ./gcov/

# Expose 60555 for use in the GUI
EXPOSE 60555

# Run application once image is accessed by default
CMD ["./project", "--cli"]