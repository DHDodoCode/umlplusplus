#!/bin/bash
set -o errexit

view="$1"

# Select interface view for program based on parameter given 
# Either CLI or GUI. GUI still assumes you have port 60555 open.
case $view in 
CLI) ./project --cli;;
GUI) ./project;;
*) echo "No view specified!"
esac