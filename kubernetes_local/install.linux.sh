echo "### Local Kubernetes setup script v0.1"

echo "# Installing Vagrant..."
sudo apt-get install virtualbox vagrant

echo "# Installing kubectl..."
wget http://storage.googleapis.com/kubernetes-release/release/v1.5.1/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "### Local Kubernetes setup completed successfully."
