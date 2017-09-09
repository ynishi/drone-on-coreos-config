.PHONY: usege install

usage:
	@echo "usage:"
	@echo "  1. change ansible/drone-servers.yml"
	@echo "     ansible_host"
	@echo "     ansible_ssh_private_key_file"
	@echo "  2. make setup && make install" 

setup:
	cd ansible && ansible-galaxy install defunctzombie.coreos-bootstrap -p roles/defunctzombie.coreos-bootstrap 

check: 
	cd ansible && ansible-playbook -i drone-servers.yml bootstrap.yml --check
	cd ansible && ansible-playbook -i drone-servers.yml playbook.yml --check

install: check
	cd ansible && ansible-playbook -i drone-servers.yml bootstrap.yml 
	cd ansible && ansible-playbook -i drone-servers.yml playbook.yml 
