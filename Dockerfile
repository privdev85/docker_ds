FROM python:3.8.2-buster

RUN apt-get update && apt-get install -y --no-install-recommends sudo apt-utils dialog
RUN apt-get install -y --no-install-recommends gcc
RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    curl \
    wget \
    vim \
    emacs \
    liblapack-dev

RUN python3 -m pip install virtualenv \
                           pipenv


RUN set -eux; \
	apt-get update; \
	apt-get install -y gosu; \
	rm -rf /var/lib/apt/lists/*; \
# verify that the binary works
	gosu nobody true

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]