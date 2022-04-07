# =class nodered
class nodered (
  String $version,
  String $base_dir,
  String $owner,
  String $group,
  Integer $listen_port,
  Boolean $manage_user,
  Boolean $manage_selinux,
  Boolean $manage_service,
) {
  contain nodered::selinux
  contain nodered::user
  contain nodered::package
  contain nodered::install
  contain nodered::service
}
