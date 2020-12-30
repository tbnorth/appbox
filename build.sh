USER_ID=`id -u`
GROUP_ID=`id -g`
USERNAME=`whoami`

read -p 'Command for running docker (sudo, dzdo, nothing): ' PRIV

cat > _runX11.sh << EOT
$PRIV docker run --tty --interactive --rm \\
    -e DISPLAY=\$DISPLAY \\
    -e HOME=\$HOME \\
    -u \$(id -u):\$(id -g) \\
    -v /tmp:/tmp \\
    -v \${HOME}:/home/\${USER} \\
    -v /tmp/.X11-unix:/tmp/.X11-unix \\
    ${USERNAME}_appbox xterm
EOT

cat > _build.sh << EOT
read -p 'PASSWORD (for container user): ' -s PASSWORD
$PRIV docker build \\
       --build-arg USER_ID=$USER_ID \\
       --build-arg GROUP_ID=$GROUP_ID \\
       --build-arg USERNAME=$USERNAME \\
       --build-arg GROUPNAME=`id -gn` \\
       --build-arg PASSWORD=\$PASSWORD \\
       --tag ${USERNAME}_appbox .
EOT

echo Created _build.sh and _runX11.sh:
echo
sed 's/^/    /' < _build.sh
echo
echo edit if needed, then \`source _build.sh\`
echo see also \`_runX11.sh\`


