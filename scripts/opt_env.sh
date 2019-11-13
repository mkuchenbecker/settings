#!/bin/bash
echo_blue "################################################################################"


#################### Commands ####################

fuckglide() {
    echo -e "${RED}fuckglide${NC} glide cc && rm -rf vendor && glide up --strip-vendor"
    glide cc
    rm -rf vendor
    rm -rf ~/.glide
    if [ -n "$1" ]; then
        glide up --strip-vendor
    else
        glide install
    fi
}
echo -e "${RED}fuckglide${NC} glide cc && rm -rf vendor && glide up --strip-vendor"
