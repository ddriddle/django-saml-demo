entityId
http://www.testshib.org/metadata/testshib-providers.xml

openssl req -new -x509 -days 3652 -nodes -out sp.crt -keyout saml.key
https://discovery.itrust.illinois.edu/itrust-certs/itrust.pem

Documentation

* https://github.com/onelogin/python-saml
* https://developers.onelogin.com/saml/python

Install
===============

On Debian Jessie:

  $ sudo apt-get update && sudo apt-get install -y libxmlsec1-dev python-pip python-dev git
  $ git clone git@github.com:ddriddle/django-saml-demo.git
  $ pip install --user -r requirements.txt
  $ python manage.py runserver <private_ip>:8000


Get private_ips from

  $ terraform output private_ips
