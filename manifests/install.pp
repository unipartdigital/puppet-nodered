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

    file_line { "${flow_name} user settings":
      path      => "${path}/settings.js",
      line      => "userDir: \"${nodered::home}/.node-red/\",",
      match     => '^\s*(\/\/)?\s*userDir\:',
      subscribe => Vcsrepo[$path]
    }

    if $flow['secret'] {
      file_line { "${flow_name} credentials":
        path      => "${path}/settings.js",
        line      => "credentialSecret: \"${flow['secret']}\",",
        match     => '^\s*(\/\/)?\s*credentialSecret\:',
        subscribe => Vcsrepo[$path]
      }
    }

    exec { "${flow_name}: Ignore changes to settings.js":
      command     => 'git update-index --skip-worktree settings.js',
      cwd         => $path,
      path        => '/bin:/usr/bin',
      refreshonly => true,
      subscribe   => Vcsrepo[$path]
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
