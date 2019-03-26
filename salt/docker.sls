docker-ppa:
  pkgrepo.managed:
    - humanname: Docker PPA
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable
    - file: /etc/apt/sources.list.d/docker.list
    - gpgcheck: 1
    - key_url: https://download.docker.com/linux/ubuntu/gpg
  
docker-ce:
  pkg.installed:
    - version: 5:18.09.3~3-0~ubuntu-bionic
docker-ce-cli:
  pkg.installed:
    - version: 5:18.09.3~3-0~ubuntu-bionic
containerd.io:
  pkg.installed:
    - version: latest
