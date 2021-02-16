# Postman - API response utility

Having built `${USERNAME}_appbox` as [described here](..), first build the
`${USERNAME}_postman` image from within [this folder](.):

```shell
docker build -t ${USERNAME}_postman .
```
then run it
```shell
docker run -it --rm -p 30022:22 -v $HOME:$HOME \
  --name ${USERNAME}_postman ${USERNAME}_postman
```
You only need to map the port (`-p 30022:22`) if you're going to use ssh X11
forwarding, and mapping home (`$HOME:$HOME`) is optional too.

From the container's shell, you can run postman with
`/postman/Postman/Postman`.
