# == Class: pure_postgres::postgresql_server
#
# This class imports postgresql module
class pure_postgres::postgresql_server
(
) inherits pure_postgres 
{

   class { 'postgresql::server':
     package_name               => 'postgres-9.6',
     client_package_name        => 'postgres-9.6-client',
     package_ensure             => true,
   
     service_ensure             => false,
     service_manage             => false,
     service_name               => 'postgres',
     service_restart_on_change  => false,
     default_database           => 'postgres',
     listen_addresses           => '*',
     port                       => 5432,
   
     initdb_path                => '/usr/pgpure/postgres/9.6/bin/initdb',
     createdb_path              => '/usr/pgpure/postgres/9.6/bin/createdb',
     psql_path                  => '/usr/pgpure/postgres/9.6/bin/psql',
     pg_hba_conf_path           => '/etc/pgpure/postgres/9.6/data/pg_hba.conf',
     pg_ident_conf_path         => '/etc/pgpure/postgres/9.6/data/pg_ident.conf',
     postgresql_conf_path       => '/etc/pgpure/postgres/9.6/data/postgresql.conf',
     recovery_conf_path         => '/var/pgpure/postgres/9.6/data/recovery.conf',
   
     datadir                    => '/var/pgpure/postgres/9.6/data',
     xlogdir                    => '/var/pgpure/postgres/9.6/data/pg_xlog',
     logdir                     => '/var/log/pgpure/postgres',
   
     user                       => 'postgres',
     group                      => 'postgres',
   
     needs_initdb               => false,
   
# Do not set encoding, since postgresql::server::initdb would try to change it 
# before postgres is running and on every run where postgres wasn't running, you get an error like:
#   Error: /Stage[main]/Postgresql::Server::Initdb/Postgresql_psql[Set template1 encoding to utf8]: 
#   Could not evaluate: Error evaluating 'unless' clause, returned pid 3252 exit 2: 'psql: 
#   could not connect to server: No such file or directory
#     encoding                   => 'utf8',
   
     manage_pg_hba_conf         => false,
     manage_pg_ident_conf       => false,
     manage_recovery_conf       => false,
     manage_postgresql_conf     => false,
   
     #Deprecated
     version                    => '9.6',
   }
}

