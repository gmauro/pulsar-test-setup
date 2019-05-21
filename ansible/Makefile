help:
	@echo "Please use \`make <target>\` where <target> is one of"
	@echo "  clean                    to remove roles directory"
	@echo "  galaxy                   to configure Galaxy server"
	@echo "  pulsar                   to configure Pulsar server"
	@echo "  rabbit                   to configure rabbitMQ server"


galaxy: install_roles
	ansible-playbook galaxy.yml

pulsar: install_roles
	ansible-playbook pulsar.yml

rabbit: install_roles
	ansible-playbook rabbit.yml

install_roles:
	ansible-galaxy install -p roles -r requirements.yml

clean:
	rm -rf roles
