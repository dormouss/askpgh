#!/bin/bash

# move into the ab directory (where all this
# stuff is n'at)
cd  /vagrant

# run the python setup
python setup.py develop

# setup askbot
askbot-setup -n /home/vagrant -e 1 -u ab -p ab -d askpgh

cd  /home/vagrant

# copy files
python manage.py collectstatic <<< yes

# setup tables
python manage.py syncdb <<< no

# do general table migration
python manage.py migrate askbot

# setup stuff for openid
python manage.py migrate django_authopenid

# finalize migration
python manage.py syncdb --migrate --noinput

chown -R vagrant:vagrant /home/vagrant