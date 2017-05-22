# MYBACKUPCLIENT

A collection of cloud backup utilities i like



## SCOPE OF THIS IMAGE

Execute my favorites backup utilies in a linux computer without installing anything



## contents

- ssh client
- rsync
- git client
- zbackup
- rclone (see newc/rclone)

Plus utilities in ubuntu package (tar,...)

## How to build

Execute make to build the image {due to the needs to compile rclone}

## AN EXAMPLE

rsync from {SOURCEFOLDER} to {REMOTEUSER}@{REMOTEHOST}:{REMOTEFOLDER}

docker run --rm  -v {SOURCEFOLDER}:/source mysinmyc/mybackupclient rsync -e ssh -alv /source {REMOTEUSER}@{REMOTEHOST}:{REMOTEFOLDER}