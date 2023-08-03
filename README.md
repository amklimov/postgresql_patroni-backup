This script makes a backup of PostgreSQL databases deployed in the Patroni cluster on the VM. The script determines which VM is the leader and performs database backup through a single connection point to the Patroni cluster.

On any VM, create a directory for backups:
sudo mkdir -p /opt/backup/database

If necessary, we assign rights to the directory:
sudo chmod 777 /opt/backup/database

Creating a script in the directory /opt/backup/ :
sudo vi pgsql_patroni_backup.sh

Copy the contents of the script into it and save it.

To successfully run the script according to the schedule (the script will run every day at 00:30), we make changes to crontab:
crontab -e
30 0 * * * /opt/backup/pgsql_patroni_backup.sh
