# Deploy HA k8s cluster with kubeadmin using ansible and vagrant

* Deploy 8 virtual machines with ubuntu 18.04 using vagrant

* Install k8s on VM - 3 node as master, 3 as worker using ansible roles, 2 as ingress node and external access to k8s api

* Use HAproxy to load balance k8s api-server

* Use kube-vip to create HA VIP for master node

* Use 2 GW node to access k8s api-server outside of cluster
