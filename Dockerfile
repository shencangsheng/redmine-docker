FROM redmine:4.2.3-alpine3.15

RUN apk update \
    && apk add --no-cache gcc g++ make libffi-dev \
    && rm -rf /var/cache/apk/*

RUN touch /etc/environment && chmod -R 777 /etc/environment

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 777 /docker-entrypoint.sh

#RUN sed -i '$d' /var/spool/cron/crontabs/root

#RUN echo '*/1     *       *       *       *       cd /usr/src/redmine && bundle exec rake redmine:check_periodictasks RAILS_ENV="production" >> /dev/null 2>&1' >> /var/spool/cron/crontabs/root