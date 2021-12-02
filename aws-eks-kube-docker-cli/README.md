# Linux with CLIs for AWS, Amazon EKS, Kubernetes, and Docker

![Build and Push to Docker Hub](https://github.com/integrational/always-latest-docker-images/actions/workflows/build-tag-push-to-dockerhub.yml/badge.svg)

Linux (Ubuntu) base image with

- `aws`, the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- `eksctl`, the [Amazon EKS CLI](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
- `kubectl`, the [Kubernetes CLI](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- `aws-iam-authenticator`, to [authenticate to a Kubernetes cluster using AWS IAM](https://github.com/kubernetes-sigs/aws-iam-authenticator)
- `docker`, the [Docker CE CLI](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- `jq`

*Example:* **run bash** in the container with an already configured AWS CLI context:
```
docker run --rm -it                                     \
           -e 'AWS_ACCESS_KEY_ID=...'                   \
           -e 'AWS_SECRET_ACCESS_KEY=...'               \
           -e 'AWS_DEFAULT_REGION=...'                  \
           -v /var/run/docker.sock:/var/run/docker.sock \
           integrational/aws-eks-kube-docker-cli:latest
```

and then, in bash, either create a cluster with `eksctl` or find and attach to an existing cluster in the default region:
```
eksctl get cluster
aws eks update-kubeconfig --name <cluster-name>
kubectl get all
```

*Example:* **run a script** `./script.sh` (containing CLI commands like the above) in the container with an already configured AWS CLI context, then return:
```
docker run --rm -t                                      \
           -e 'AWS_ACCESS_KEY_ID=...'                   \
           -e 'AWS_SECRET_ACCESS_KEY=...'               \
           -e 'AWS_DEFAULT_REGION=...'                  \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -v $(pwd)/script.sh:/script.sh               \
           integrational/aws-eks-kube-docker-cli:latest /script.sh
```

## Details

The **workdir** is `/` and this is also where the container entrypoint script is located.

The container **entrypoint script** configures the AWS CLI with `aws configure` using the values of **environment variables** and so the container must be run with:
```
docker run -e 'AWS_ACCESS_KEY_ID=...'     \
           -e 'AWS_SECRET_ACCESS_KEY=...' \
           -e 'AWS_DEFAULT_REGION=...'    \
           -e 'AWS_DEFAULT_OUTPUT=json'
```
where only `AWS_DEFAULT_OUTPUT` can be omitted and then defaults to `json`.

The entrypoint script then **executes** the command supplied on the `docker run` command-line or `/bin/bash`.

To list **available Kubernetes clusters** in the chosen default region, run this in the container:
```
eksctl get cluster
```

Before using **kubectl** from within the container against one of these Kubernetes clusters, run this in the container:
```
aws eks update-kubeconfig --name <cluster-name>
```

To use **docker** CLI from within the container, reusing the host's docker daemon, run the container like this:
```
docker run -v /var/run/docker.sock:/var/run/docker.sock ...
```

Before running **docker push** to an **AWS ECR** repo from within the container, run this in the container (assuming the repo is in the chosen default region):
```
$(aws ecr get-login --no-include-email)
```
