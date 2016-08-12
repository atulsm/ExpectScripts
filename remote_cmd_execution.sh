#!/usr/bin/expect

# This script will execute any command on a remote machine and come back
# Sample use:  
#	./remote_cmd_execution.sh 10.10.10.1 root password "ls /tmp"   
#	./remote_cmd_execution.sh 10.10.10.1 root password "reboot"   

set ip [lindex $argv 0]
set user [lindex $argv 1]
set pass [lindex $argv 2]
set command [lindex $argv 3]

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
send -- "$command\r"

expect "#"
send -- "quit\r"


