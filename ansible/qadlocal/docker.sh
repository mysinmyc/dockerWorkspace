#!/bin/bash

cat <<EOF
{
    "group": {
        "hosts": [
EOF

vOut=""
for vCurContainerId in $(docker ps --format " {{.ID}}") 
do
	[ -n "${vOut}" ] && vOut="${vOut},"
	vOut="${vOut}\"${vCurContainerId}\""
done

echo $vOut

cat <<EOF
        ],
        "vars": {
            "ansible_connection": "docker",
            "remote_user": "rootx"
        }
    }
}
EOF
