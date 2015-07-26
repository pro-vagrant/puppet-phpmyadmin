class phpmyadmin::vhost {

    apache::vhost { 'phpmyadmin.lh':
        port          => '9999',
        docroot       => '/app/phpmyadmin',
        docroot_owner => 'vagrant',
        docroot_group => 'vagrant',
        notify        => Service['apache2'],
        directories   => [
            {
                path           => '/app/phpmyadmin',
                allow_override => ['All'],
            },
        ],
    }

    file_line { 'add_phpmyadmin.lh_domain_in_hosts_file':
        path => '/etc/hosts',
        line => "127.0.0.1   phpmyadmin.lh"
    }

}