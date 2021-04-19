#!/usr/bin/env bash

set -e

echo "Running rubocop auto-corrector"
rubocop -A
