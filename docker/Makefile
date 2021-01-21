version=0.1

build:
	docker image build -t mitm_img:${version} --build-arg VERSION=${version} .

create_network: build
	docker network create mitm_net --gateway=172.19.0.1 --subnet=172.19.0.0/24

run_attacker: build
	docker run -it --cap-add=NET_ADMIN --name mitm_attacker --network mitm_net --ip 172.19.0.2 mitm_img:0.1 /bin/bash

run_victim: build
	docker run -it --cap-add=NET_ADMIN --name mitm_victim --network mitm_net --ip 172.19.0.3 mitm_img:0.1 /bin/bash

copy_scripts: build
	docker cp ../scripts/attacker_script.sh mitm_attacker:/root/attacker_script.sh
	docker cp ../scripts/victim_script.sh mitm_victim:/root/victim_script.sh

retrieve_capture: build
	docker cp mitm_attacker:/root/capture.pcap ../captures/capture.pcap

test: build
	docker run --rm --name mitm_tmp mitm_img:${version}

clean:
	docker network rm mitm_net
	docker rm -f mitm_attacker mitm_victim

clean_all:
	docker rm -f mitm_attacker mitm_victim
	docker network rm mitm_net
	docker image rm mitm_img:${version}
