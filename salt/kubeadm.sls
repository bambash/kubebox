kubeadm_init:
  cmd.run:
  {% if grains['host'] == 'kubebox-master-01' %}
  - name: kubeadm init --config /vagrant/master.yaml
  - unless: test -f /etc/kubernetes/admin.conf
  {% elif grains['host'] == 'kubebox-node-01' %}
  - name: kubeadm join --config /vagrant/node.yaml
  {% endif %}

{% if grains['host'] == 'kubebox-master-01' %}
kubeconfig:
  cmd.run:
  - name: mkdir /home/vagrant/.kube && cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config && chown -R vagrant:vagrant /home/vagrant
  - unless: test -f /home/vagrant/.kube/config

install_cni:
  cmd.run:
  - env:
    - KUBECONFIG: /etc/kubernetes/admin.conf
  - name: kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
{% endif %}
