## forestsoft/remoteshell

Container to execute shellscripts on an remote host with authentication handling

### Usage

to make an interactive teminal on remote shell
```bash
docker run  -e SSH_USER=forest -e SSH_HOST=remoteip --rm -it forestsoft/remoteshell 
```

to execute an shellscript on remote
```bash
docker run -eSSH_HOST=192.168.178.53 -eSSH_USER=forest -eSSH_KEY="$(cat ~/.ssh/id_rsa)" -v$(pwd):/app/ --rm -it forestsoft/remoteshell /app/test.sh
```

to execute an script local inside container to upload some files i.e. 
```bash
docker run -eSSH_HOST=192.168.178.53 -eMODE=local -eSSH_USER=forest -eSSH_KEY="$(cat ~/.ssh/id_rsa)" -v$(pwd):/app/ --rm -it forestsoft/remoteshell /app/test.sh
```

in this example the /app/test.sh will be executed inside forestsoft/remoteshell container you can reach the remote host with

```bash
ssh remote
scp -r /app/ remote:/path/to/remote/target
```

