REMOTE_JMC_FILE=https://raw.githubusercontent.com/AndreasSko/Galaxy-Benchmarker/master/galaxy_files/job_metrics_conf.xml

help:
	@echo "Please use \`make <target>\` where <target> is one of"
	@echo "  clean                    remove roles directory"
	@echo "  galaxy                   configure Galaxy server"
	@echo "  rabbit                   configure rabbitMQ server"


galaxy: install_roles
	ansible-playbook galaxy.yml

rabbit: install_roles
	ansible-playbook rabbit.yml

install_roles:
	ansible-galaxy install -p roles -r requirements.yml

get_job_metrics:
	wget -O files/job_metrics_conf.xml ${REMOTE_JMC_FILE}

clean:
	rm -rf roles
