#!/bin/bash
set -o errexit

view="$1"

# Build program
cmake -B build 
cmake --build build --parallel

# Select interface view for program based on parameter given 
# Either CLI or GUI. GUI still assumes you have port 60555 open.
case $view in 
"CLI") build/project --cli;;
"GUI") build/project;;
*) echo "No view specified!"
esac