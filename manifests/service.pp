#= nodered::service
class nodered::service inherits nodered {
  require nodered::install

  if $nodered::manage_service {
    $nodered::flows.each |$flow_name, $options| {
      file { "/etc/systemd/system/node-red-${$flow_name}.service":
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template("${module_name}/etc/systemd/system/node-red.service.erb"),
      }

      service { "node-red-${$flow_name}":
        ensure  => running,
        enable  => true,
        require => File["/etc/systemd/system/node-red-${flow_name}.service"]
      }
    }
  }
}
