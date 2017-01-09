weechat in docker
=================

This is weechat installed in official docker debian-testing (slim)

To start, create config folder, place your weechat config there -- or just create folder to get stock configs and run weechat:

```
docker run -ti --rm -e HOST_USER=${USER} -v ${PWD}/config:/home/${USER}/.weechat andrius/docker-weechat
```
