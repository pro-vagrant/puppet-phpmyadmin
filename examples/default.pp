#
# sudo puppet apply -e 'include phpmyadmin'
#

include stdlib
ensure_packages(['git'])
include php5

include ::apache::mod::rewrite

class { 'apache':
    mpm_module    => prefork,
    user          => 'vagrant',
    group         => 'vagrant',
    default_vhost => false,
    require       => Class['php5'];
}

class { '::apache::mod::php':
    path => "${::apache::params::lib_path}/libphp5.so",
}

class { '::mysql::server':
  root_password => 'alamakota'
}

###### phpMyAdmin

include phpmyadmin
include phpmyadmin::vhost

