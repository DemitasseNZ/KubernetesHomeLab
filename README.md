**Kubernetes Home Lab**

This repository automates provisioning a small Kubernetes cluster with a single master and two worker nodes.
The VMs are all Fedora 25 and have Docker 1.03 and Kubernetes deployed using shell scripts from this folder.
Vagrant Up will deploy the three nodes and init the cluster on the master. The output from the init is redirected into kubeinit.log in the Vagrant folder. 
Use the join command line in this file to have each node join the cluster

This home lab was originally created for a TechTarget article, when the article is published I will ad a link from here.

