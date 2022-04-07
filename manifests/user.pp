# =Class node-red::user
class node-red::user inherits node-red {
  if $node-red::manage_user {
    group { $node-red::group:
      ensure => present
    }

    user { $node-red::owner:
      ensure  => present,
      gid     => $node-red::group,
      require => Group[$node-red::group]
    }
  }
}
