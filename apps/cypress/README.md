Needs a `USERNAME` and `GROUPNAME` build arg.

Example build and run:
```shell
docker build --build-arg USERNAME=tbrown02 --build-arg GROUPNAME=analysis \
    -t tbrown02_cypress .
docker run --rm -p 30022:22 -v ~/repo/cyptest/ncdsnap/:/tests \
    --name tbrown02_cypress tbrown02_cypress
# log in via MobaXTerm or similar
bash  # for tab completion
cd /tests
/home/tbrown02/node_modules/.bin/cypress open
```
