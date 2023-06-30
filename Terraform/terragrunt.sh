#!/bin/bash
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.48.0/terragrunt_linux_arm64
sudo mv terragrunt_linux_arm64 /usr/local/bin/terragrunt
terragrunt --version