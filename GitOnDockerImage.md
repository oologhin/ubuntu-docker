# Connecting git to remote from a Docker Image
1. Make sure you are connect to the image
2. Clone your repository
3. Modify and commit it

## Clone 
Ensure Git is Installed in the Container

Since you've already installed Git in the Dockerfile, you should be able to use Git inside the container. Verify Git is installed by running:

```sh

git --version
Clone the GitHub Repository
```
Navigate to the desired directory and clone your GitHub repository. Since we have a volume mounted (/workspace), you can clone the repository into that directory:

```sh

cd /workspace
git clone https://github.com/oologhin/k3s-helm-airflow.git
```
Navigate to the Project Directory

Change to the project directory:

```sh

cd k3s-helm-airflow
```