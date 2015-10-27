class phpmyadmin {

    include stdlib
    ensure_packages(['git'])

    exec { 'create dir for phpmyadmin':
        path    => '/usr/bin:/bin:/usr/sbin:/sbin',
        command => 'mkdir -p /var/www && chown vagrant:vagrant /var/www',
    }

    vcsrepo { '/var/www/phpmyadmin':
        ensure   => 'present',
        provider => 'git',
        source   => 'https://github.com/phpmyadmin/phpmyadmin.git',
        user     => 'vagrant',
        group    => 'vagrant',
        depth    => 1,
        branch   => 'RELEASE_4_4_10',
        require  => Exec['create dir for phpmyadmin']
    }

}
