# =Class nodered::selinux
# nodered touches a lot of interesting places in the filesystem,
# but it does generally document these places quite well so we can
# make sure they're handled appriopriately
class nodered::selinux inherits nodered {
  if $nodered::manage_selinux {
    selinux::boolean { 'httpd_can_network_connect': }
  }
}
