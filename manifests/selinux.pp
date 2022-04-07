# =Class node-red::selinux
# node-red touches a lot of interesting places in the filesystem,
# but it does generally document these places quite well so we can
# make sure they're handled appriopriately
class node-red::selinux inherits node-red {
  if $node-red::manage_selinux {
    selinux::boolean { 'httpd_can_network_connect': }
  }
}
