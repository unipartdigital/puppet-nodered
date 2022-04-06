# =Class nodered::db
class nodered::db inherits nodered {
  if $nodered::manage_database and ($nodered::db_host == 'localhost' or $nodered::db_host =~ /^127\./) {
    case $nodered::db_type {
      'postgres': {
        include postgresql::server

        postgresql::server::db { $nodered::database_name:
          user     => $nodered::db_user,
          password => postgresql_password($nodered::db_user, $nodered::db_pass),
        }

        if defined('pgdump::dump') {
          class { 'pgdump::dump':
            db_name     => $nodered::database_name,
            db_dump_dir => $nodered::dump_dir,
            require     => Postgresql::Server::Db[$nodered::database_name]
          }
        }
      }
      'mysql': {
        include ::mysql::server

        mysql::db { $nodered::database_name:
          user     => $nodered::db_user,
          password => $nodered::db_pass,
        }
      }
      default: {
        warning("Database type ${nodered::db_type} is not supported")
      }
    }
  }
}
