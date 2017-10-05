# Prototyping Lab - Vagrant PHP7 Starter

A simple Vagrant LAMP setup running PHP7.

## What's inside?

- Ubuntu 14.04.3 LTS (Trusty Tahr)
- Vim, Git, Curl, etc.
- Apache
- PHP7 with some extensions
- MySQL 5.6
- Node.js with NPM
- RabbitMQ
- Redis
- Composer
- phpMyAdmin

## How to use

- Install [Vagrant](https://www.vagrantup.com/downloads.html) - Homebrew works nicely for macOS
- Install Vagrant plugins:
```
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-env
```
- Clone this repository
- Edit `.env` to set IP, host and DB
```
IP_ADDRESS="192.168.100.102"
HOSTNAME="pic.dev" # Updates /etc/hosts automatically
## Database config
DB_NAME="pic"
# DB_SQL_DUMP="sql/latest.sql" # If present will import this sql.
# DB_REPLACEDOMAIN="app.dev" # Will replace this domain with $HOSTNAME
```

- Run ``vagrant up``
- Navigate to e.g. ``http://pic.dev/``
- Navigate to ``http://phpmyadmin-pic.dev/`` (both username and password are 'root')

## Resetting or reimporting database
If you need to reset the database or reimport and SQL dump change the `.env` configuration and run:
```
vagrant ssh -c "sh /vagrant/scripts/database.sh"
```

## Troubleshooting
- Noticed strange behaviours when using certain TLDs (e.g. `.local`) so stick to `.dev` suffix for domains
