#!/bin/bash

wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.48.0/terragrunt_linux_amd64

mv terragrunt_linux_amd64 terragrunt

chmod u+x terragrunt

mv terragrunt /usr/local/bin/terragrunt

terragrunt -v