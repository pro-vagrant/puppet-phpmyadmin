class phpmyadmin {

    file { '/app':
        ensure => directory,
        owner => 'vagrant',
        group => 'vagrant'
    }

    vcsrepo { '/app/phpmyadmin':
        ensure   => 'present',
        provider => 'git',
        source   => 'https://github.com/phpmyadmin/phpmyadmin.git',
        user     => 'vagrant',
        group    => 'vagrant',
        depth    => 1,
        branch   => 'RELEASE_4_4_10',
        require  => File['/app']
    }

}
