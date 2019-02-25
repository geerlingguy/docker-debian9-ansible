# Debian 9 (Stretch) Ansible Test Image

Debian 9 (Stretch) Docker container for Ansible playbook and role testing.

## How to Use

1. [Install Docker](https://docs.docker.com/engine/installation/).
2. Pull this image from Docker Hub: `docker pull midacts/docker-debian9-ansible:latest`
3. Run a container from the image: `docker run --name deb-ans --volume=/var/run/docker.sock:/var/run/docker.sock -it midacts/docker-debian9-ansible:latest`
  a. Ansible can be run from outside of the container:
    1. `docker exec --tty [container_id] env TERM=xterm ansible --version`
    2. `docker exec --tty [container_id] env TERM=xterm ansible-playbook /path/to/ansible/playbook.yml --syntax-check`

## Notes

This container allows me to test roles and playbooks using Ansible running locally inside the container.