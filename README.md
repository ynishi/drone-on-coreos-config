# drone-on-coreos-config
drone on coreos config management files
* baseed on official page https://coreos.com/blog/managing-coreos-with-ansible.html
* using ansible(need ansible setup on local.)

## usage 
* set vars
```
make usage
```
* make
```
make setup && make install
```
* when run drone from ansible, set vars by change drone-servers.yml or --extra-vars
```
cd ansible
ansible-playbook -i drone-servers.yml playbook.yml --extra-vars="drone_secret=abc"
```
