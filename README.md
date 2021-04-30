# Deploy HA k8s cluster with kubeadmin using ansible and vagrant

* Deploy 8 virtual machines with ubuntu 18.04 using vagrant

* Install k8s on VM - 3 node as master, 3 as worker using ansible roles, 2 as ingress node

* Use HAproxy to load balance k8s api-server

* Use kube-vip to create HA VIP for master node

* Use RBAC to restrict access to cluster

* Use 2 GW node to access k8s test application outside of cluster with Ingress
Deploy Ingress-nginx-controller as daemon set on gw1 and gw2. Deploy Metalllb. Create and deploy LoadBalancer type service connected to Ingress Daemon sets. Create deployment for 2 web services. Create 2 ClusterIP type services. Create Kind:Ingress which proxy external request to web services inside k8s cluster.

* Enable TLS connection with Ingress. Store cert and key in HashiCorp Vault, deployed in cluster.

* Deploy Rancher Local Path Provisioner.

* Create test web application deployment with storage usage

TODO:
 1. edit port in kubeconfig file 6443->8443
 2. Label all worker and gw nodes -> worker[1:3] and gw[1:2]
 3. Deploy Metallb using Helm
 4. Deploy ingress as daemonset on gw1 and gw2 using Helm
 5. Deploy Rancher Local Path Provisioner using Helm
 6. Deploy Vault in k8s 
 7. Add TLS cert and key to vault
 8. Inject cert and key from vault to ingress
 
