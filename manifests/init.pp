# =class nodered
class nodered (
  String $version,
  String $owner,
  String $group,
  String $home,
  String $flow_dir,
  Hash[String, String] $ssh_keys,
  Hash[String, Hash[String, String]] $flows,
  Boolean $manage_user,
  Boolean $manage_home,
  Boolean $manage_keys,
  Boolean $manage_selinux,
  Boolean $manage_service,
) {
  $real_home = $home? {
    ''      => "/home/${owner}",
    default => $home
  }
  contain nodered::selinux
  contain nodered::user
  contain nodered::package
  contain nodered::install
  contain nodered::service
}
