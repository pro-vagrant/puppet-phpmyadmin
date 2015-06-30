class phpmyadmin {

    file { '/app':
        ensure => directory,
        user => 'vagrant',
        group => 'vagrant'
    }

    vcsrepo { '/app/phpmyadmin':
        ensure   => 'present',
        provider => 'git',
        source   => 'https://github.com/phpmyadmin/phpmyadmin.git',
        user     => 'vagrant',
        group    => 'vagrant',
        depth    => 1,
        branch   => '4.4.10',
        require  => File['/app']
    }

}
