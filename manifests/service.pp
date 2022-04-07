#= node-red::service
class node-red::service inherits node-red {
  require node-red::install

  if $node-red::manage_service {
    file { '/etc/systemd/system/node-red.service':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/etc/systemd/system/node-red.service.erb"),
    }

    service { 'node-red':
      ensure  => running,
      enable  => true,
      require => File['/etc/systemd/system/node-red.service']
    }
  }
}
