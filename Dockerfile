FROM python:3.11-bookworm

MAINTAINER Raphael Michel
USER root

RUN apt-get update && \
	apt-get install -y git \
	    libxml2-dev libxslt1-dev python3-virtualenv locales libffi-dev \
     	build-essential python3-dev zlib1g-dev libssl-dev gettext git ghostscript \
	    libmemcached-dev libjpeg-dev libpq-dev pdftk bzip2 \
	    wget tar openssh-client libmaxminddb0 libmaxminddb-dev \
	    libluajit-5.1-dev pkg-config libxmlsec1-dev libxmlsec1-openssl nodejs npm \
		enchant myspell-de-de aspell-en rsync sudo \
	    --no-install-recommends && \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/* && \
		dpkg-reconfigure locales && \
		locale-gen C.UTF-8 && \
		/usr/sbin/update-locale LANG=C.UTF-8 && \

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /
RUN pip install virtualenv uv

CMD ["/bin/bash"]
