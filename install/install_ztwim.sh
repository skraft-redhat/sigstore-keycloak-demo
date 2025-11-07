#!/bin/bash

export TRUST_DOMAIN=apps.sno.irgendeine.cloud

envsubst < ./SpireServer.yaml | oc apply -f -

envsubst < ./SpireAgent.yaml | oc apply -f - 

oc apply -f SpiffeCSIDriver.yaml

envsubst < ./SpireOIDCDiscoveryProvider.yaml | oc apply -f -

