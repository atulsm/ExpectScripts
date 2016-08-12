# ExpectScripts

Demonstrate capabilities of Expect scripting to do remote operations.
- remote_ls
    - This script will execute ls command on a desired remote folder
        - ./remote_cmd_execution.sh 10.10.10.1 root password "ls /tmp"
 - remote_cmd_execution
    - This script will execute any command on a remote machine and come back
        -  ./remote_cmd_execution.sh 10.10.10.1 root password "ls /tmp"
 - remote_scipt_copy_execution
    - This script will execute any script after copying to a remote machine
        - ./remote_script_copy_execution.sh 10.10.10.1 root password "sample.sh"

