Might need the `--privileged` flag for this one:
```shell
docker run --rm -it -p 30022:22 -v $HOME:$HOME --name compassbox --privileged compassbox
```

