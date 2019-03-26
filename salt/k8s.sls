k8s-ppa:
  pkgrepo.managed:
    - humanname: Kubernetes PPA
    - name: deb https://apt.kubernetes.io/ kubernetes-xenial main
    - file: /etc/apt/sources.list.d/kubernetes.list
    - dist: kubernetes-xenial
    - gpgcheck: 1
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
  
kubectl:
  pkg.installed:
    - version: 1.14.0-00
kubeadm:
  pkg.installed:
    - version: 1.14.0-00
kubelet:
  pkg.installed:
    - version: 1.14.0-00
