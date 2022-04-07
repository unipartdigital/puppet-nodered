# =Class nodered::install
class nodered::install inherits nodered {
  require nodered::package

  $nodered::flows.each |$flow_name, $flow| {
    vcsrepo { "${nodered::flow_dir}/${flow['path']}":
      ensure   => latest,
      user     => $nodered::owner,
      provider => git,
      source   => $flow['source'],
      identity => "${nodered::real_home}/.ssh/${flow['key']}"
    }
  }
}
