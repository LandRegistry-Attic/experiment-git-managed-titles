#!/bin/bash

# bail on fail
set -e

# This sets up the new machine for the git experiment
./scripts/1_setup.sh

# Create 24m titles (flat JSON files in our case)
./scripts/2_create.sh

# Modify each title a few times (including commit with GPG signing)
./scripts/3_modify.sh

# logs
#+ check the Git footprint (large?)
#+ auditing (log per title), performance of auditing
#+ retrieve a specific version of a title; walk back in time. Performance of this.

./scripts/4_results.sh
