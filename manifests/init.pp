# =class nodered
class nodered (
  String $version,
  String $base_dir,
  String $owner,
  String $group,
  String $home,
  Hash[String, String] $ssh_keys,
  Array[Hash[String, String]] $flows,
  Integer $listen_port,
  Boolean $manage_user,
  Boolean $manage_home,
  Boolean $manage_keys,
  Boolean $manage_selinux,
  Boolean $manage_service,
) {
  $real_home = $home? {
    ''      => "/home/${owner}",
    Default => $home
  }
  contain nodered::selinux
  contain nodered::user
  contain nodered::package
  contain nodered::install
  contain nodered::service
}
