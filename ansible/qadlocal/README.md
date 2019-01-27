
Quick and dirty ansible project to use local docker container as hosts

# INVENTORY
Performed trough docker ps

# REMOTE COMMAND EXECUTION
docker exec as root

# EXAMPLE
````
 ansible all -m command -a hostname
````

