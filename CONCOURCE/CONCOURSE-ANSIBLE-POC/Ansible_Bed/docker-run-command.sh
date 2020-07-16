docker build -t mjolnir/ansible:latest .

docker run -it -v ${PWD}/config_side:/ansible -v ${PWD}/playbook_side:/ansible/playbooks -v ~/.ssh:/root/.ssh mjolnir/ansible:latest sh

docker run -v ${PWD}/config_side:/ansible -v ${PWD}/playbook_side:/ansible/playbooks -v ~/.ssh:/root/.ssh mjolnir/ansible:latest ansible nodes -m ping

docker run -v ${PWD}/config_side:/ansible -v ${PWD}/playbook_side:/ansible/playbooks -v ~/.ssh:/root/.ssh mjolnir/ansible:latest ansible-playbook playbooks/hello_world_laybook.yml

docker run -v ${PWD}/config_side:/ansible -v ${PWD}/playbook_side:/ansible/playbooks -v ~/.ssh:/root/.ssh mjolnir/ansible:latest ansible-playbook playbooks/git_clone_playbook.yml

docker-compose -f concourse_build.yml -d up