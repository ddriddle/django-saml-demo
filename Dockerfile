FROM python:2.7

WORKDIR /app
COPY . .

RUN pip install --no-cache-dir uwsgi
RUN useradd uwsgi -s /bin/false
RUN chown -R uwsgi:uwsgi /app

RUN apt-get update && apt-get install -y --no-install-recommends \
      libxml2-dev \
      libxmlsec1-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

USER uwsgi

CMD ["/app/uwsgi"]
