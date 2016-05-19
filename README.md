# ansible-environment
Vagrant setup which provides an Ansible environment with EC2 provisioning support.

## Quick start

1. docker build .
2. docker run -v /Users/murariuf/Source/:/host/share -e AWS_ACCESS_KEY_ID=<key> -e AWS_SECRET_ACCESS_KEY=<secret> -e AWS_REGION=eu-west-1 -i -t <docker image id> /bin/bash
If you are using AWS then make sure you source the environment variables:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_REGION

Vagrant is setup by default to use the latest stable release of Ansible.  If you want the development branch then run `$ vagrant up development`, remember to use the machine name as required, e.g. `$ vagrant ssh development`.  The development machine will take a while to download all the dependencies, but for your wait you get bleeding edge functionality.  Once the functionality you require has made release, just destroy the development machine and revert back to stable.

Sample
```bash
ansible-playbook provision-aws.yml -vvvv -e ssh_key_name=aimia-devops -e my_route53_zone=messaging.nectar.com -e voucherupdate_aws_key=<key> -e voucherupdate_aws_secret=<secret> -e voucherupdate_env=stg -e ssl_certificate_id_arn='arn:aws:iam::016608567734:server-certificate/wildcard_nectar_com' -e env=staging```
