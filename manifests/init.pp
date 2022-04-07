# =Class node-red
class node-red (
  String $version,
  String $base_dir,
  String $owner,
  String $group,
  Integer $listen_port,
  Boolean $manage_user,
  Boolean $manage_selinux,
  Boolean $manage_service,
) {
  contain node-red::selinux
  contain node-red::user
  contain node-red::package
  contain node-red::install
  contain node-red::service
}
