#!/bin/bash

git config --local user.name 'Stephan Kraft'
git config --local user.email 'skraft@redhat.com'

git config --local commit.gpgsign true
git config --local gpg.x509.program gitsign
git config --local gpg.format x509
