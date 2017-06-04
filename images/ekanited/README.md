# EKANITE

basic log collection and analisys



## SCOPE OF THIS IMAGE

store all the logs of my playground environment for inquiry. Not suitable for production


## contents


## How to build

Execute make to build the image {due to the needs to compile ekanite}

## AN EXAMPLE

docker run -d -p 8080:8080 -p 5514:5514 -p 10514:10514 mysinmyc/ekanited

to perform queries open a brower to http://{serverhost}:8080

## HOW TO SEND DATA
Configure RSYSLOG to send data

$template Ekanite,"<%pri%>%protocol-version% %timestamp:::date-rfc3339% %HOSTNAME% %app-name% %procid% - %msg%\n"
*.*             @@{host}:5514;Ekanite

