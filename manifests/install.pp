# =Class nodered::install
class nodered::install inherits nodered {
  require nodered::package

  $nodered::flows.each |$flow_name, $flow| {
    $path = "${nodered::flow_dir}/${flow['path']}"

    vcsrepo { $path:
      ensure   => latest,
      user     => $nodered::owner,
      owner    => $nodered::owner,
      group    => $nodered::group,
      provider => git,
      source   => $flow['source'],
      identity => "${nodered::real_home}/.ssh/${flow['key']}"
    }

    nodejs::npm { $path:
      ensure           => 'present',
      target           => $path,
      use_package_json => true,
      user             => $nodered::owner,
      home_dir         => "${nodered::real_home}/.npm",
      require          => Vcsrepo[$path]
    }
  }
}
