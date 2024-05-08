FROM gitpod/workspace-full

RUN sudo apt-get update \
 && sudo apt-get install -y \
 build-essential clang llvm lld gcc-aarch64-linux-gnu bc cpio libssl-dev
