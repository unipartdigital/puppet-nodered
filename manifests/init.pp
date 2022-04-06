# =Class nodered
class nodered (
  String $version,
  String $base_dir,
  String $owner,
  String $group,
  Boolean $manage_user,
  Boolean $manage_selinux,
) {
  contain nodered::selinux
  contain nodered::user
  contain nodered::package
  contain nodered::install
}
