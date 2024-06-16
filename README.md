# ubuntu-docker
1. create a ubuntu machine on docker
2. run the maschine
3. connect to this machine with visual source

# Prerequisites
- Docker: Make sure Docker is installed and running on your system.
- Visual Studio Code: Install Visual Studio Code.
- Remote - Containers Extension: Install the "Remote - Containers" extension in VS Code.

## Create ubuntu machine
### Create docker image
make sure you have the dockerfile in the folder
```bash
docker build -t ubuntu-ssh .

```
## run the image
Once the image is built, create and run a Docker container from this image:

```sh
docker run -d -p 2222:2222 --name ubuntu-ssh -v $(pwd):/workspace ubuntu-ssh

```
### Configure SSH access
```sh
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ubuntu-ssh
```
### Update SSH Configuration:

Edit your ~/.ssh/config file with the correct IP address:

```sh
Host my-ubuntu-container
    HostName <container-ip-address>
    Port 2222
    User root
    PasswordAuthentication yes
```
## Connect VS Code to the Docker Container Using Remote - SSH

- Open VS Code: Open Visual Studio Code.
-I nstall Remote - SSH Extension: If not already installed, install the Remote - SSH extension from the Extensions view (Ctrl+Shift+X).
- Open the Command Palette: Press Ctrl+Shift+P to open the Command Palette.
- Select Remote-SSH: Type and select Remote-SSH: Connect to Host....
- Choose the Container: Select my-ubuntu-container from the list.
- Enter Password: Enter the root password (password as specified in the Dockerfile).

# Connect to docker console in container 
```sh
docker run -it --name ubuntu-ssh-debug -v $(pwd):/workspace ubuntu-ssh bash

```