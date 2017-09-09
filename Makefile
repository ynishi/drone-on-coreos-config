.PHONY: usege create setup check install

usage:
	@echo "usage:"
	@echo "  1. change terraform/terraform.tfvars"
	@echo "  2. make create
	@echo "  3. change ansible/drone-servers.yml"
	@echo "     ansible_host"
	@echo "     ansible_ssh_private_key_file"
	@echo "  4. make setup && make install"

create:
	cd terraform && terraform plan && terraform apply

setup:
	cd ansible && ansible-galaxy install defunctzombie.coreos-bootstrap -p roles/defunctzombie.coreos-bootstrap

check:
	cd ansible && ansible-playbook -i drone-servers.yml bootstrap.yml --check
	cd ansible && ansible-playbook -i drone-servers.yml playbook.yml --check

install: check
	cd ansible && ansible-playbook -i drone-servers.yml bootstrap.yml
	cd ansible && ansible-playbook -i drone-servers.yml playbook.yml
