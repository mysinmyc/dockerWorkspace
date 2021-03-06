#!/bin/bash

function list {
cat <<EOF
{
    "containers": {
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
        }
    }
}
EOF
}

case $1 in
        --list)
                list
        ;;
        --host)
        	docker inspect $2 -f "{{json .}} "
        ;;
        *)
                exit 10
        ;;
esac
