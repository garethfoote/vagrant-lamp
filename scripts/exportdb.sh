#!/bin/bash
vagrant ssh -c "cd /vagrant/public && wp db export --add-drop-table /vagrant/sql/latest.sql"
