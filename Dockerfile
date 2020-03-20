FROM python:3.8.2-buster

WORKDIR /usr/martin_bierey/docker_test

COPY ./ /usr/martin_bierey/docker_test

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


RUN pip install -r requirements.txt

# Install jupyter
RUN pip3 install jupyter


EXPOSE 8888

VOLUME /usr/martin_bierey/docker_test

CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]


