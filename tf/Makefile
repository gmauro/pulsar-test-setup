help:
	@echo "Please use \`make <target>\` where <target> is one of"
	@echo "  apply                    to apply all the modification to the infrastructure"
	@echo "  clean                    to destroy all the infrastructure items"
	@echo "  init                     to initialize terraform environments"
	@echo "  plan                     to verify all the infrastructure items"

apply: link
	yes yes | terraform apply

clean: clean_galaxy clean_rabbit clean_common

init: link
	terraform init
link:
	ln -sf ../terraform/vars.tf
	ln -sf ../terraform/image.tf
	ln -sf ../terraform/output.tf _output.tf
	ln -sf ../terraform/keypairs.tf _keypairs.tf
	ln -sf ../terraform/secgroup_egress.tf _secgroup_egress.tf
	ln -sf ../terraform/secgroup_public-ping.tf _secgroup_public-ping.tf
	ln -sf ../terraform/secgroup_public-rabbitmq.tf _secgroup_public-rabbitmq.tf
	ln -sf ../terraform/secgroup_public-web.tf _secgroup_public-web.tf
	ln -sf ../terraform/secgroup_ufr-ssh.tf _secgroup_ufr-ssh.tf
	ln -sf ../terraform/glx.tf _galaxy.tf
	ln -sf ../terraform/rabbit.tf _rabbit.tf

plan: link
	terraform plan

clean_common:
	rm -rf _*.tf
	yes yes | terraform apply

clean_galaxy:
	rm _galaxy.tf
	yes yes | terraform apply

clean_rabbit:
	rm _rabbit.tf
	yes yes | terraform apply

