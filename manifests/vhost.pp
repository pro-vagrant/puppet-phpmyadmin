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

}