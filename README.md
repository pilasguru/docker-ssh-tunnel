# docker-ssh-tunnel

Join your SSH private key using commas:

```
docker run -it \
-p 8080:8080 \
-e TUNNELOPTS=8080:localhost:8080 \
-e TUNNELTO=root@123.123.123.123 \
-e PRIVATE_SSH_KEY="-----BEGIN RSA PRIVATE KEY-----,iuhISHDiuahsdiauhsdIUHSD,-----END RSA PRIVATE KEY-----" \
chinello/ssh-tunel:latest
```
