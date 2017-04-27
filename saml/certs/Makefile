CN := drone.sandbox.aws.illinois.edu

sp.crt: sp.key

sp.key:
	openssl req -new -x509 -days 3652 -nodes \
		-subj "/C=US/ST=Illinois/L=Urbana/O=UIUC/CN=$(CN)" \
		-out sp.crt \
		-keyout sp.key

clean:
	-rm sp.crt sp.key
