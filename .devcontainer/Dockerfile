# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.154.0/containers/go/.devcontainer/base.Dockerfile

FROM ubuntu:latest

WORKDIR /workspaces/umlplusplus

RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    git \
    curl \
    && apt-get clean

# Install without package manager Option 1:
# RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
#     chmod 700 get_helm.sh && \
#     ./get_helm.sh 

# Install without package manager Option 2:
# COPY install.sh .
# RUN chmod +x install.sh && ./install.sh
