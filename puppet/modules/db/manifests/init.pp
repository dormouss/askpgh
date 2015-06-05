# create a database for the environment
class { 'postgresql::server': }

class db::create {
  # create dat db n'at
  postgresql::server::db { 'askpgh':
    user     => 'ab',
    password => postgresql_password('ab', 'ab'),
  }
}
