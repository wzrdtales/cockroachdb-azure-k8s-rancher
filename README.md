# cockroachdb-azure-k8s-rancher
A set of k8s configs + containers to setup cockroach in rancher on k8s with some optional tweaks to fix azure.

# Usage

This setup requires you to setup local volumes. See 
[here](https://github.com/kubernetes-incubator/external-storage/tree/master/local-volume)
for reference. You can however use the provisioner_generated.yaml in the k8s folder. 
Note that you need to follow the setup instructions to enable the feature as described in
the docs from the link above.

Before you actually execute the provisioner, you will have to deploy remount-azure.yaml
which will prepare your host accordingly. After that the local volumes will be generated
and added.

Now you can deploy the crdb.yaml and the ntpd-azure.yaml. The latter one applies the
azure fix (unbinding hypervisor clock) and also synchronizes the clocks, which is 
essential to run cockroachdb reliably.

The last step is executing cluster-init-secure.yaml, to initialize your cluster for the
first time. Since this is a secure setup, you will also need to assign and approve
certificates. See cockroachdbs [docs](https://www.cockroachlabs.com/docs/stable/orchestrate-cockroachdb-with-kubernetes.html#step-4-approve-node-certificates) for that.


