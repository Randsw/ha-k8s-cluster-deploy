# Deploy HA k8s cluster with kubeadmin using ansible and vagrant

* Deploy 8 virtual machines with ubuntu 18.04 using vagrant

* Install k8s on VM - 3 node as master, 3 as worker using ansible roles, 2 as ingress node

* Use HAproxy to load balance k8s api-server

* Use kube-vip to create HA VIP for master node

* Use RBAC to restrict access to cluster

* Use 2 GW node to access k8s test application outside of cluster with Ingress
Deploy Ingress-nginx-controller as daemon set on gw1 and gw2. Deploy Metalllb. Create and deploy LoadBalancer type service connected to Ingress Daemon sets. Create deployment for 2 web services. Create 2 ClusterIP type services. Create Kind:Ingress which proxy external request to web services inside k8s cluster.

* Deploy Rancher Local Path Provisioner.

* Deploy Hashicorp Vault

* Deploy cert-manager

* Enable TLS connection with Ingress. Generate CA based on Vault and use cert-manager to renew certificate

* Create test web application deployment

Known issue:
1. Problem with kubeconfig after first master init. kubectl wait failed. Reason unknown
2. Other master init problem. ectd check failure due timeout. Reason unknow. Try to solve problem using kubectl wait
