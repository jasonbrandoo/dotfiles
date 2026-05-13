#!/bin/bash

set -e

wf-recorder --audio -g $(slurp -d) --file=$(date +"$HOME/Downloads/%Y-%m-%d_%H-%M-%S.mp4")
