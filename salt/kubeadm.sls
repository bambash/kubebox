kubeadm_init:
  cmd.run:
  - name: kubeadm init
  - unless: test -f /etc/kubernetes/admin.conf

kubeconfig:
  cmd.run:
  - name: mkdir /root/.kube && cp /etc/kubernetes/admin.conf /root/.kube/config
  - unless: test -f /root/.kube/config
