# =Class nodered
class nodered (
  String $version,
  String $base_dir,
  String $owner,
  String $group,
  String $db_host,
  String $db_user,
  String $db_pass,
  Integer $db_port,
  Boolean $manage_database,
  Boolean $manage_selinux,
  Enum['mysql', 'postgres'] $db_type,
  Optional[String] $db_name = undef,
) {
  $database_name = $db_name ? {
    undef => split($::fqdn, '\.')[0],
    default => $db_name
  }

  contain nodered::selinux
  contain nodered::package
  contain nodered::db
  contain nodered::install
}
