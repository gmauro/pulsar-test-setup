help:
	@echo "Please use \`make <target>\` where <target> is one of"
	@echo "  clean                    to remove roles directory"
	@echo "  galaxy                   to configure Galaxy server"
	@echo "  pulsar                   to configure Pulsar server"
	@echo "  rabbit                   to configure rabbitMQ server"


galaxy: install_roles get_job_metrics
	ansible-playbook galaxy.yml

pulsar: install_roles get_job_metrics
	ansible-playbook pulsar.yml

rabbit: install_roles
	ansible-playbook rabbit.yml

install_roles:
	ansible-galaxy install -p roles -r requirements.yml

get_job_metrics:
	wget -O files/job_metrics_conf.xml https://raw.githubusercontent.com/usegalaxy-eu/infrastructure-playbook/master/files/galaxy/config/job_metrics_conf.xml

clean:
	rm -rf roles
