MySqlWorkbench
==============


Run this beautifull tool without installing tons of libraries


#How to run

To run a temporary readonly container execute the following command 
```
docker run -t -i --read-only --tmpfs /tmp --tmpfs /root -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority --net host --userns host --rm mysinmyc/mysqlworkbench
```
