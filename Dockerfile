# GoLang Build Image
FROM golang:latest AS build

# Version Variable
ENV BRIDGE_VERSION="2.3.0"

# Install Build Dependencies
RUN apt-get update && \
    apt-get install -y libsecret-1-dev

# Build Source
WORKDIR /build/
RUN git clone https://github.com/ProtonMail/proton-bridge.git && \
    cd proton-bridge && \
    git checkout v${BRIDGE_VERSION} && \
    make build-nogui

# Rocky Base Image
FROM fedora:37

# Login Variables
ENV USERNAME=""
ENV PASSWORD=""
ENV 2FA_CODE="false"
ENV LOGIN="false"
ENV INTERACTIVE="false"

# Install dependencies
# Install dependencies and protonmail bridge
RUN dnf upgrade --refresh -y && \
    dnf install -y \
    dbus-x11 \
    expect \
    gnome-keyring \
    libsecret
    
# Copy Binary From Build Stage
COPY --from=build /build/proton-bridge/proton-bridge /proton/

# Copy scripts
COPY ./scripts /proton/scripts
RUN ["chmod", "-R", "+x", "/proton/scripts"]

# Start Protonmail-Bridge
CMD ["/proton/scripts/entrypoint.sh"]