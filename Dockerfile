FROM python:3-alpine
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

RUN apk add --no-cache git && \
	git clone https://hipstercat.fr/gogs/hipstercat/hrss.git && \
	cd hrss && \
	pip3 install -r requirements.txt && \
	apk del git

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENV BASE_URL="/"
WORKDIR /hrss
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 8000

COPY context_processor.py web/context_processor.py
