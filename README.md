# mudd-dbs

Mudd Databases App upgrade/migration to Rails

## Setting up your local machine for development purposes

 ```
 bundle install
 rails db:create
 rails db:migrate
 rails db:seed
 ```

## Syncing Database between servers

1. Create a dump of the database from the machine that has the data `<host-with-data>` (get the database host, user name and password from /opt/mudd-dbs/current/database.yml)
   ```
   ssh pulsys@<host-with-data>
   more config/database.yml
   mysqldump -h <database host> -u <database user> -p  <database name> >~/dump.sql 
   exit
   ```
1. Copy the dump from the machine that has the data to the machine that needs the data `<host-receive-data>`
   ```
   scp pulsys@<host-with-data>:dump.sql .
   scp dump.sql pulsys@<host-receive-data>:dump.sql
   rm dump.sql
   ```
1. Import the datbase on the server that needs the data (get the database host, user name and password from /opt/mudd-dbs/current/database.yml)
   ```
   ssh pulsys@<host-receive-data>
   cd /opt/mudd-dbs/current
   more config/database.yml
   mysql -h <database host> -u <database user> -p <database name> < ~/dump.sql
   exit
   ```
