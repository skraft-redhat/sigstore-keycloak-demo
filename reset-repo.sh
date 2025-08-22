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
