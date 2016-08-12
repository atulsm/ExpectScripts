#!/usr/bin/expect

# @author  : atulsm@gmail.com
# This script will execute any script after copying to a remote machine
# Sample use:  
#	./remote_script_copy_execution.sh 10.10.10.1 root password "sample.sh"   

set ip [lindex $argv 0]
set user [lindex $argv 1]
set pass [lindex $argv 2]
set script [lindex $argv 3]

#First copy the script from local folder
spawn scp $script $user@$ip:/tmp/

expect {
    "yes/no" {
        send "yes\r"
        exp_continue
    }

    "assword:" {
        send -- "$pass\r"
    }
}

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
send -- "/tmp/$script\r"

expect "#"
send -- "quit\r"


