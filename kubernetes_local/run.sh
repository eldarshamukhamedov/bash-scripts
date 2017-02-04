echo "### Local Kubernetes cluster provisioning script v0.1"

echo "# Provisioning k8s-master and k8s-nodes..."
vagrant up

echo "# Configure kubectl to use the new cluster"
kubectl config set-cluster vagrant-cluster --server=http://172.18.18.101:8080
kubectl config set-context vagrant-system --cluster=vagrant-cluster
kubectl config use-context vagrant-system

echo "# Applying Calico for networking..."
kubectl apply -f calico.yaml

echo "# Applying SkyDNS for service discovery..."
kubectl apply -f skydns.yaml

echo "# Applying Dashboard for monitoring..."
kubectl create -f kubernetes-dashboard.yaml

echo "### Local Kubernetes cluster provisioning script v0.1"