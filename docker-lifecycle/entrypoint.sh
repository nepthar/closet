#!/bin/bash

#Trap SIGTERM and SIGINT
trap 'true' SIGTERM
trap forward_ctrl_c SIGINT


# Pass ctrl+c (SIGINT) to the child
forward_ctrl_c() {
  kill -INT $child
}

# Run pre-start
/app/pre-start.sh

# Execute command
"${@}" &
child=$!

# Wait on the child's PID
wait $child

# Run the post script
/app/post-end.sh
