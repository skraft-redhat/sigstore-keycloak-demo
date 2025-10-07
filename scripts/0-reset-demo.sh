#!/bin/bash

git config --local --unset user.name
git config --local --unset user.email

git config --local --unset commit.gpgsign
git config --local --unset gpg.x509.program 
git config --local --unset gpg.format 

git config --local --unset gitsign.fulcio
git config --local --unset gitsign.rekor
git config --local --unset gitsign.issuer
git config --local --unset gitsign.clientID

skopeo copy docker://quay.io/openshift-examples/simple-http-server:micro docker://quay.io/stephan_kraft/any_image:1.0

export IMAGE=quay.io/stephan_kraft/any_image:1.0
rm -rf ~/.sigstore
