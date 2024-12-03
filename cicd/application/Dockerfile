# Filename: Dockerfile
# Description: Pulls from buildImage to create a final image to upload.

# -----------------------------------------------

# Stage 1: Use an Alpine image to build the code
FROM buildimage AS builder

# -----------------------------------------------

# Stage 2: Create image 
FROM alpine:latest

# Set working directory
WORKDIR /app

# Add shared libraries so code can use dynamic links
RUN apk --no-cache add libgcc libstdc++

# Copy the statically compiled binary from the builder stage
COPY --from=builder /workspaces/umlplusplus/build/project /app

# Expose 60555 for use in the GUI
EXPOSE 60555

# Run application once image is accessed by default
CMD ["./project", "--cli"]