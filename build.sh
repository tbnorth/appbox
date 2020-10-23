USER_ID=`id -u`
GROUP_ID=`id -g`
USERNAME=`whoami`

cat > _build.sh << EOT
read -p 'PASSWORD: ' -s PASSWORD
docker build \\
       --build-arg USER_ID=$USER_ID \\
       --build-arg GROUP_ID=$GROUP_ID \\
       --build-arg USERNAME=$USERNAME \\
       --build-arg GROUPNAME=`id -gn` \\
       --build-arg PASSWORD=\$PASSWORD \\
       --tag appbox --tag tnb`date +%Y%m%d%H%M%S` .
EOT

echo Created _build.sh:
echo
sed 's/^/    /' < _build.sh
echo
echo edit if needed, then \`source _build.sh\`


