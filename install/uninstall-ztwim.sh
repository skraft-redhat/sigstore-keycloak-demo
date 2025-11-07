#!/bin/bash

oc delete ZeroTrustWorkloadIdentityManager cluster
oc delete SpireOIDCDiscoveryProvider cluster
oc delete SpiffeCSIDriver cluster
oc delete SpireAgent cluster
oc delete SpireServer cluster
oc delete pvc -l=app.kubernetes.io/managed-by=zero-trust-workload-identity-manager
oc delete csidriver -l=app.kubernetes.io/managed-by=zero-trust-workload-identity-manager
oc delete service -l=app.kubernetes.io/managed-by=zero-trust-workload-identity-manager
oc delete ns zero-trust-workload-identity-manager
oc delete clusterrolebinding -l=app.kubernetes.io/managed-by=zero-trust-workload-identity-manager
oc delete clusterrole -l=app.kubernetes.io/managed-by=zero-trust-workload-identity-manager
oc delete validatingwebhookconfigurations -l=app.kubernetes.io/managed-by=zero-trust-workload-identity-manager

oc delete crd spireservers.operator.openshift.io
oc delete crd spireagents.operator.openshift.io
oc delete crd spiffecsidrivers.operator.openshift.io
oc delete crd spireoidcdiscoveryproviders.operator.openshift.io
oc delete crd clusterfederatedtrustdomains.spire.spiffe.io
oc delete crd clusterspiffeids.spire.spiffe.io
oc delete crd clusterstaticentries.spire.spiffe.io
oc delete crd zerotrustworkloadidentitymanagers.operator.openshift.io

