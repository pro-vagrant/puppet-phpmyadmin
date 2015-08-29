class phpmyadmin::vhost {

    apache::vhost { 'phpmyadmin.lh':
        port          => '9999',
        docroot       => '/var/www/phpmyadmin',
        docroot_owner => 'vagrant',
        docroot_group => 'vagrant',
        directories   => [
            {
                path           => '/var/www/phpmyadmin',
                allow_override => ['All'],
            },
        ],
    }

    file_line { 'add_phpmyadmin.lh_domain_in_hosts_file':
        path => '/etc/hosts',
        line => '127.0.0.1   phpmyadmin.lh'
    }

}