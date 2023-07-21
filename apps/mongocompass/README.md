# NOTE:  *** IMPORTANT *** compassbox needs to be built on a 20.04 based image

Might need the `--privileged` flag for this one:

```shell
docker run --rm -it -p 30022:22 -v $HOME:$HOME --name compassbox --privileged compassbox
```

How I use this in practice

In one shell:

```shell
docker build -t compassbox --build-arg USERNAME=$USER .  # once only
docker run --rm -it -p 30022:22 -v $HOME:$HOME --name compassbox --privileged compassbox
```

in another shell:

```shell
ssh -Y -p 30022 127.0.0.1
mongodb-compass
```

And finally `docker rm -f compassbox` to kill it when you're done.

Currently saving logins is not working, probably unwritable `$HOME` because of running as root,
forget what issue seemed to make that necessary.
