#!/bin/bash

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt

# Android
if [[ $(uname) == 'Darwin' ]]
then
    export ANDROID_HOME=${HOME}/Library/Android/sdk
else
    export ANDROID_HOME=${HOME}/Android/Sdk
fi
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export ANDROID_SDK_ROOT=${ANDROID_HOME}
