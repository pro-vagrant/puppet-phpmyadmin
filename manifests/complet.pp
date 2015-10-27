class phpmyadmin::complet {

    include stdlib
    ensure_packages(['git'])

    include php5

    $override_options = {
      'mysqld' => {
        'bind-address' => '0.0.0.0',
      }
    }

    class { '::mysql::server':
        root_password    => "this-is-SECRET",
        override_options => $override_options
    }

    include ::apache::mod::rewrite

    class { 'apache':
        mpm_module    => prefork,
        user          => "vagrant",
        group         => "vagrant",
        default_vhost => false,
        require       => Class['php5'];
    }

    class { '::apache::mod::php':
        path => "${::apache::params::lib_path}/libphp5.so",
    }

    include phpmyadmin
    include phpmyadmin::vhost

}