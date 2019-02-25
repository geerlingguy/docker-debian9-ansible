FROM debian:stretch
LABEL maintainer="midacts"

# Install dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
       apt-transport-https build-essential ca-certificates curl \
       gnupg2 libffi-dev libssl-dev nano \
       python-pip python-dev python-setuptools python-wheel \
       software-properties-common sudo systemd \ 

# Docker prereq
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update

# Docker install
RUN apt-get install docker-ce -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Install Ansible via pip
ENV pip_packages "ansible ansible-lint cryptography docker flake8 molecule testinfra virtualenv yamllint"
RUN pip install $pip_packages

# Install Ansible inventory file
RUN mkdir -p /etc/ansible
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts
CMD ["/lib/systemd/systemd"]