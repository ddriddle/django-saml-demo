FROM	python:2.7

COPY	. /app

WORKDIR /app

RUN     pip install --no-cache-dir uwsgi
RUN     useradd uwsgi -s /bin/false
RUN     chown -R uwsgi:uwsgi /app

RUN	apt-get update && apt-get install -y python-dev libxml2-dev libxmlsec1-dev libxmlsec1-openssl libxslt1-dev

USER	uwsgi

RUN     pip install --user --no-cache-dir -r requirements.txt

EXPOSE  8000


CMD ["/app/uwsgi"]
