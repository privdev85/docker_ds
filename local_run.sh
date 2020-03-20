docker build ./ -t light_gbm

docker run -p 9999:8888 -v "$PWD":/usr/martin_bierey/docker_test light_gbm