#!/bin/bash

git config --local user.name 'Stephan Kraft'
git config --local user.email 'skraft@redhat.com'

git config --local commit.gpgsign true
git config --local gpg.x509.program gitsign
git config --local gpg.format x509

git config --local gitsign.fulcio $(oc get fulcio -o jsonpath='{.items[0].status.url}' -n tssc-tas)
git config --local gitsign.rekor $(oc get rekor -o jsonpath='{.items[0].status.url}' -n tssc-tas)
git config --local gitsign.issuer https://$(oc get route keycloak -n tssc-keycloak | tail -n 1 | awk '{print $2}')/realms/trusted-artifact-signer
git config --local gitsign.clientID trusted-artifact-signer

rm -rf ~/.sigstore

export TEST="foo"

export TUF_URL=$(oc get tuf -o jsonpath='{.items[0].status.url}' -n tssc-tas)
export OIDC_ISSUER_URL=https://$(oc get route keycloak -n tssc-keycloak | tail -n 1 | awk '{print $2}')/auth/realms/trusted-artifact-signer
export COSIGN_FULCIO_URL=$(oc get fulcio -o jsonpath='{.items[0].status.url}' -n tssc-tas)
export COSIGN_REKOR_URL=$(oc get rekor -o jsonpath='{.items[0].status.url}' -n tssc-tas)
export COSIGN_MIRROR=$TUF_URL
export COSIGN_ROOT=$TUF_URL/root.json
export COSIGN_OIDC_CLIENT_ID="trusted-artifact-signer"
export COSIGN_OIDC_ISSUER=$OIDC_ISSUER_URL
export COSIGN_CERTIFICATE_OIDC_ISSUER=$OIDC_ISSUER_URL
export COSIGN_YES="true"
export SIGSTORE_FULCIO_URL=$COSIGN_FULCIO_URL
export SIGSTORE_OIDC_ISSUER=$COSIGN_OIDC_ISSUER
export SIGSTORE_REKOR_URL=$COSIGN_REKOR_URL
export REKOR_REKOR_SERVER=$COSIGN_REKOR_URL

cosign initialize
