#!/bin/bash

wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.48.0/terragrunt_linux_amd64

sudo mv terragrunt_linux_amd64 terragrunt

sudo mv terragrunt /usr/local/bin/terragrunt

sudo terragrunt --version