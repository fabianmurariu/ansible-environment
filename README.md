# ansible-environment
Vagrant setup which provides an Ansible environment with EC2 provisioning support.

## Quick start

1. Clone this project to your local machine;
2. Run `vagrant up`;
3. Login to your Vagrant machine `vagrant ssh`;
4. You'll find your home directory has been mapped to `/home/host-machine/`;
5. Run whatever Ansible playbook/commands you like.

If you are using AWS then make sure you source the environment variables:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION
