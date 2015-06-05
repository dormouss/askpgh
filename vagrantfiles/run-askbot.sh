#!/bin/bash

# move into the ab directory (where all this
# stuff is n'at)
cd  /home/vagrant

# start the askbot server
python manage.py runserver $ASKBOT_HOST:8000