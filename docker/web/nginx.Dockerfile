FROM nginx
RUN apt-get update -qq && apt-get -y install apache2-utils
ENV RAILS_ROOT /var/www/test_app
WORKDIR $RAILS_ROOT
RUN mkdir log
COPY public public/
COPY ./docker/web/nginx.conf /tmp/docker.nginx
RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]