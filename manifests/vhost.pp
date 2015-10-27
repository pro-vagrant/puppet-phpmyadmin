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

    host { 'phpmyadmin.lh':
        ip => '127.0.0.1'
    }


}