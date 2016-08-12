#!/usr/bin/expect

# This script will execute ls command on a desired remote folder
# Sample use:  ./remote_cmd_execution.sh 10.10.10.1 root password "ls /tmp"   

set ip [lindex $argv 0]
set user [lindex $argv 1]
set pass [lindex $argv 2]
set path [lindex $argv 3]

spawn ssh $user@$ip

expect {
    "yes/no" {
        send "yes\r"
        exp_continue
    }

    "assword:" {
        send -- "$pass\r"
    }
}

expect "#"
send -- "ls $path\r"

expect "#"
send -- "quit\r"


