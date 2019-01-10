# z3c
zcash insight

zcash-block-explorer

Script to install and setup a zcash block explorer on Ubuntu 16.04 Server.

On a fresh Ubuntu 16.04 server, from a non-root user's home directory, run the following commands:

sudo apt-get update

wget https://raw.githubusercontent.com/vikoiv/z3c/1.2_sapling-explorer/part1.sh

bash part1.sh

The script requires you to logout when it is finished, log back in and run part 2. It outputs the commands to do so.

The command to run the block explorer is output at the end of the second script. The server runs in the foreground, and for production use you will want to run it in a tmux or screen session, or under a process manager such as supervisor.

The block explorer will be available on http://localhost:3001/insight/ and any additional IP addresses your server has bound to its network interface.

All actions performed by the script are thouroughly commented.

Blockchain explorer patches for zcashd by @zcash-hackworks. Modified version from @radix42 scripts.
