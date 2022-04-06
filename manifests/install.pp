# =Class nodered::install
class nodered::install inherits nodered {
  require nodered::selinux
  require nodered::package

  # file { "${nodered::docroot}/LocalSettings.php":
  #   content => template("${module_name}/opt/nodered/docroot/LocalSettings.php.erb"),
  #   mode    => '0644',
  #   owner   => $nodered::owner,
  #   group   => $nodered::group,
  #   require => Exec['maintenance/install.php'],
  #   notify  => Exec['maintenance/update.php']
  # }
}
