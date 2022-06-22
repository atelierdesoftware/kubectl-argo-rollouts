FROM starubiquitous/kubectl:master

ARG ARGO_VERSION="1.2.0"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    curl -L https://github.com/argoproj/argo-rollouts/releases/download/v$ARGO_VERSION/kubectl-argo-rollouts-linux-amd64 -o /usr/local/bin/kubectl-argo-rollouts && \
    chmod +x /usr/local/bin/kubectl-argo-rollouts && \
    kubectl argo rollouts version && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cluster-info"]
