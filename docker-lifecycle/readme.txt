Docker-lifecycle

This demonstrates runnign a simple docker service through an entrypoint
script that traps signals allowing for something to run after the main
program has finished.

This happens by making entrypoint hold on to PID 1 and trapping/handling
signals.
