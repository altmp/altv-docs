#!/bin/bash

if ! command -v mono &> /dev/null
then
    echo "mono could not be found, it is required to continue."
    exit 1
fi

if ! command -v pwsh &> /dev/null
then
    echo "pwsh could not be found, it is required to continue."
    exit 1
fi

pwsh ./build.ps1
