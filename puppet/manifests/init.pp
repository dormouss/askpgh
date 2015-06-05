# ensure git/python are installed
include git
include python

# run dat update
exec { 'dat-update':
  command => 'sudo apt-get update',
  path => '/usr/bin'
}

# install postgres
class { 'postgresql::server': 
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users => '0.0.0.0/0',
  listen_addresses => '*'
}

# set a postgres rule to allow for local askbout authentication
postgresql::server::pg_hba_rule { 'allow for local authentication with the askbot user':
  type => 'local',
  database => 'askpgh',
  user => 'ab',
  auth_method => 'md5',
  order => 001
}

# uses our custom module to create 
# the askpgh db
class { 'db::create': }

# install python/postgres dev stuff
# need this for the psychopg2 library
exec { 'python-pg-dev':
  command => 'sudo apt-get install -y postgresql-server-dev-9.3 python-dev',
  path => '/usr/bin',
  require => Exec['dat-update']
}

# install the postgres python driver
python::pip { 'psycopg2' :
  pkgname => 'psycopg2',
  ensure => 'present',
  require => Exec['python-pg-dev']
}

# make sure mock is installed so that we 
# don't fail during setup
python::pip { 'mock' :
  pkgname => 'mock',
  ensure => 'present',
  require => Exec['python-pg-dev']
}

# copy over a script that can startup the askbot server
file { '/usr/local/bin/run-askbot' :
  source => '/vagrant/vagrantfiles/run-askbot.sh',
  mode => '+x'
}

file { '/usr/local/bin/setup-askbot' :
  source => '/vagrant/vagrantfiles/setup-askbot.sh',
  mode => '+x'
}

# set the ASKBOT_HOST environment variable (will make starting/stopping 
# the server a bit easier)
file { '/etc/environment' :
  content => inline_template("ASKBOT_HOST=192.168.50.60")
}