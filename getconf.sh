#! /bin/sh
### BEGIN INIT INFO
# Provides:          TODO ESTO HAY QUE CAMBIARLO
# Required-Start:
# Required-Stop:
# Should-Start:      glibc
# Default-Start:     S
# Default-Stop:
# Short-Description: Set hostname based on /etc/hostname
# Description:       Read the machines hostname from /etc/hostname, and
#                    update the kernel value with this value.  If
#                    /etc/hostname is empty, the current kernel value
#                    for hostname is used.  If the kernel value is
#                    empty, the value 'localhost' is used.
### END INIT INFO

optionalStashboxDownload() {
    status=$(curl $1 -w %{http_code} -s -S -f -o $2 --stderr err.txt)
    if [ $status -eq 404 ]; then
        echo "File $1 not found in Stashbox, local file (if any) will be used"
    elif [ $status -eq 200 ]; then
        echo "File $1 installed from StashBox"
    else
        echo "ERROR: Checking Stashbox for $1 failed, status: $status"
        cat err.txt
        exit 1
    fi;    
    }

optionalStashboxDownload("http://192.168.99.100/logo.jpg","/usr/src/app/logo.jpg")

echo "hay que joderse" > /etc/kkvaka
