FROM python:2.7

WORKDIR /app

RUN pip install --no-cache-dir uwsgi
RUN useradd uwsgi -s /bin/false
RUN chown -R uwsgi:uwsgi /app

RUN apt-get update && apt-get install -y --no-install-recommends \
      libxml2-dev \
      libxmlsec1-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

# USER uwsgi

ENV UWSGI_UID uwsgi
ENV UWSGI_GID uwsgi

# Maybe adding my SP's cert will help?
RUN cp saml/certs/sp.crt /usr/local/share/ca-certificates
RUN cp saml/certs/idp.crt /usr/local/share/ca-certificates
RUN cp saml/certs/testshib-sp.crt /usr/local/share/ca-certificates
RUN update-ca-certificates --fresh

CMD ["/app/uwsgi"]
