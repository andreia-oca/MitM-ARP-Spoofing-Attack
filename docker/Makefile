version=0.1

build:
	docker image build -t mitm_img:${version} --build-arg VERSION=${version} .

test: build
	docker run --rm --name mitm_tmp mitm_img:${version}

run_attacker: build
	docker run -it --name mitm_attacker mitm_img:${version} /bin/bash

run_victim: build
	docker run -it --name mitm_victim mitm_img:${version} /bin/bash

bash:
	docker exec -it mitm /bin/bash

clean:
	docker rm -f mitm_attacker mitm_victim

clean_all:
	docker rm -f mitm_attacker mitm_victim
	docker image rm mitm_img:${version}
