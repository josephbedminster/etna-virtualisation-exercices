#!/usr/bin/env bash

service apache2 restart
service mysql start

mysql -uroot < /home/sqlexo/000-drop_database.sql
mysql -uroot < /home/sqlexo/001-create_database.sql
mysql -uroot < /home/sqlexo/002-create_tables.sql
mysql -uroot < /home/sqlexo/003-insert_data.sql
mysql -uroot < /home/sqlexo/996-create_user_account.sql
mysql -uroot < /home/sqlexo/997-set_privileges.sql
mysql -uroot < /home/sqlexo/998-change_user_password.sql
mysql -uroot < /home/sqlexo/999-change_root_password.sql