#!/usr/bin/env bash

set -e

chef-solo -c solo.rb -j dna.json
