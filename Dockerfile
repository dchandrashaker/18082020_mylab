FROM nginx:alpine
LABEL maintainer="MyLabs"
VOLUME /myvol
CMD [ "nginx","-g","daemon off;" ]
