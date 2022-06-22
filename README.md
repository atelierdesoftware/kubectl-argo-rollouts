# Kubectl argo rollouts

[![Preview](https://argoproj.github.io/argo-rollouts/assets/logo.png)](https://argoproj.github.io/)

[![Tests](https://github.com/StarUbiquitous/kubectl-argo-rollouts/actions/workflows/tests.yaml/badge.svg)](https://github.com/StarUbiquitous/kubectl-argo-rollouts/actions/workflows/tests.yaml)

![GitHub last commit (branch)](https://img.shields.io/github/last-commit/starubiquitous/kubectl-argo-rollouts/main?style=flat-square)
[![LICENSE](https://img.shields.io/badge/License-Anti%20996-blue.svg?style=flat-square)](https://github.com/996icu/996.ICU/blob/master/LICENSE)
[![LICENSE](https://img.shields.io/badge/License-Apache--2.0-green.svg?style=flat-square)](LICENSE-APACHE)
[![996.icu](https://img.shields.io/badge/Link-996.icu-red.svg?style=flat-square)](https://996.icu)

GitHub Action for interacting with kubectl-argo-rollouts ([argo-rollouts](https://argoproj.github.io/argo-rollouts))

## Usage

To use kubectl-argo-rollouts put this step into your workflow:

### Authorization with config file

```yaml
- uses: starubiquitous/kubectl-argo-rollouts@master
  env:
    KUBE_CONFIG: ${{ secrets.KUBE_CONFIG }}
  with:
    args: get rollout
```

## Environment variables

All these variables need to authorize to kubernetes cluster.  
I recommend using secrets for this.

### KUBECONFIG file

First options its to
use [kubeconfig file](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/).

For this method `KUBE_CONFIG` required.  
You can find it: `cat $HOME/.kube/config | base64 `.

Optionally you can switch
the [context](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/) (the
cluster) if you have few in kubeconfig file. Passing specific context to `KUBE_CONTEXT`. To see the list of available
contexts do: `kubectl config get-contexts`.

| Variable     | Type            |
|--------------|-----------------|
| KUBE_CONFIG  | string (base64) |
| KUBE_CONTEXT | string          |

### KUBECONFIG file

Another way to authenticate in the cluster
is [HTTP basic auth](https://kubernetes.io/docs/reference/access-authn-authz/authentication/).

For this you need to pass:

- host (IP only, without protocol)
- username
- password
- cluster CA certificate

| Variable         | Type   |
|------------------|--------|
| KUBE_HOST        | string |
| KUBE_USERNAME    | string |
| KUBE_PASSWORD    | string |
| KUBE_CERTIFICATE | string |

## Example

```yaml
name: Get rollout
on: [ push ]

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1
      - uses: starubiquitous/kubectl-argo-rollouts@main
        env:
          KUBE_CONFIG: ${{ secrets.KUBE_CONFIG }}
        with:
          args: get rollout
```

## Versions

If you need a specific version of kubectl, make a PR with a specific version number.
After accepting PR the new release will be created.   
To use a specific version of kubectl use:

```yaml
- uses: starubiquitous/kubectl-argo-rollouts@main
  env:
    KUBE_CONFIG: ${{ secrets.KUBE_CONFIG }}
  with:
    args: get rollout
```

## License

The code in this repository, unless otherwise noted, is under the terms of both
the [Anti 996](https://github.com/996icu/996.ICU/blob/master/LICENSE) License and
the [Apache License (Version 2.0)](LICENSE-APACHE).
