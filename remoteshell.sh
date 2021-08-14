#!/bin/bash
set -e
set -o pipefail
mkdir ~/.ssh/
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
echo -e "Host *\n\tUserKnownHostsFile /dev/null\n\n" >> ~/.ssh/config
echo -e "Host *\n\tLogLevel ERROR\n\n" >> ~/.ssh/config
echo -e "Host remote\n\tHostName $SSH_HOST\nUser $SSH_USER\n" >> ~/.ssh/config

SSH_USER=${SSH_USER:-"root"}
[ "${SSH_KEY:-""}" != "" ]  || ( echo "SSH_KEY not set" && exit 1 )
[ -f "$SSH_KEY" ] && cat $SSH_KEY > ~/.ssh/id_rsa || echo  "${SSH_KEY:-""}" >  ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
if [ "${MODE:-"remote"}" == "remote" ]; then
    if [ "$1" == "" ]; then
      ssh remote
    else
        [ ! -f "$1" ] && ( echo "$1 does not exist. exiting"; exit 1)
        [ "$1" != "" ] && [ -f "$1" ] && ssh remote "bash -s " < "$1"
    fi
else 
  [ "$1" != "" ] && ( /bin/bash "$1" && exit $? ) || /bin/bash
fi
