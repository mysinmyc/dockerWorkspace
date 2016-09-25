# centos7ssh

Image centos 7 + ssh

## How to use this image


To start a container 

```
docker run -d -P -e ADDUSERS_NAMES=user1 -e ADDUSERS_PASSWORD=password mysinmyc/centos7ssh
```

environment variables:
- ADDUSERS_NAMES (optional) list of users to define locally separated by comma. 
- ADDUSERS_PASSWORD (optional) initial password of users. if omitted will be generated at first startup and printed in the container logs
- ADDUSERS_GROUP (optional) additional group for users


## Security warning
This image has a weak security configuration (no PAM,...) don't use it in production
