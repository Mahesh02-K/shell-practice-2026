#!/bin/bash

echo "Number of variables passed to script :: $#"
echo "All variables passed to script :: $@"
echo "current directory :: $PWD"
echo "Which user running this script :: $USER"
echo "user home directory :: $HOME"
echo "Script name :: $0"
echo "PID of current script :: $$"
sleep 10 &
echo "PID of last command running in background :: $!"
echo "exit code of current script :: $?"