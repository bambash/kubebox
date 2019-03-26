kubeadm_init:
  cmd.run:
  - name: kubeadm init
  - unless: test -f /etc/kubernetes/admin.conf

kubeconfig:
  cmd.run:
  - name: mkdir /root/.kube && cp /etc/kubernetes/admin.conf /root/.kube/config
  - unless: test -f /root/.kube/config

install_cni:
  cmd.run:
  - name: kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
