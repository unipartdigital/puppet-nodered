# =Class node-red::install
class node-red::install inherits node-red {
  require node-red::selinux
  require node-red::package

  # file { "${node-red::docroot}/LocalSettings.php":
  #   content => template("${module_name}/opt/node-red/docroot/LocalSettings.php.erb"),
  #   mode    => '0644',
  #   owner   => $node-red::owner,
  #   group   => $node-red::group,
  #   require => Exec['maintenance/install.php'],
  #   notify  => Exec['maintenance/update.php']
  # }
}
