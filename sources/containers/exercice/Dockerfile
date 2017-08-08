FROM tutum/lamp:latest

RUN rm -fr /app && mkdir /app 
COPY ./exo1/htdocs/index.php /app/index.php
COPY ./exo1/htdocs/config.php /app/config.php
COPY ./exo1/sql/ /home/sqlexo/
COPY ./startup.sh /home/startup.sh
RUN chmod 777 /home/startup.sh

EXPOSE 80 443 3306

CMD ./run.sh &&  service apache2 restart && tail -F /var/log/mysql/error.log