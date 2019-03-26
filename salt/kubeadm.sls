kubeadm_init:
  cmd.run:
  - name: kubeadm init
  - unless: test -f /etc/kubernetes/admin.conf

kubeconfig:
  cmd.run:
  - name: mkdir /home/vagrant/.kube && cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config && chown -R vagrant:vagrant /home/vagrant
  - unless: test -f /home/vagrant/.kube/config

install_cni:
  cmd.run:
  - env:
    - KUBECONFIG: /etc/kubernetes/admin.conf
  - name: kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
