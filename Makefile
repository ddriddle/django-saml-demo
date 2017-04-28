SRC := $(wildcard *)
SRC := $(filter-out Makefile README.md .git .gitignore metadata, $(SRC))

.PHONY: all build run exec bash kill

all: run

build: .saml

.saml: $(SRC)
	docker build -t saml .
	touch $@

.pid: .saml
	docker run -d --name saml --rm -p 8000:8000 saml
	touch $@

run: .pid metadata

exec: run
	docker exec -it saml bash

bash: .saml
	docker run -it --rm saml bash

logs:
	docker logs -f saml

metadata: saml/advanced_settings.json saml/settings.json saml/certs/sp.crt saml/certs/sp.key
	curl -o metadata -s http://127.0.0.1:8000/metadata/
	curl -F "userfile=@metadata;filename=drone.sandbox.aws.illinois.edu" \
		https://www.testshib.org/procupload.php

kill:
	-docker kill saml
	-rm -f .pid

clean:
	-rm -f .saml .pid metadata drone.sandbox.aws.illinois.edu
	-docker kill saml
	-docker rmi saml
