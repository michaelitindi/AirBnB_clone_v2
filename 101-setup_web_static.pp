#Configures a web server using puppet
class web_static_setup {


    package { 'nginx':
        ensure => installed,
    }


    service { 'nginx':
        ensure     => running,
        enable     => true,
        require    => Package['nginx'],
    }


    file { '/data/':
        ensure => 'directory',
        owner  => 'ubuntu',
        group  => 'ubuntu',
    }

    file { '/data/web_static/':
        ensure => 'directory',
        owner  => 'ubuntu',
        group  => 'ubuntu',
    }

    file { '/data/web_static/releases/':
        ensure => 'directory',
        owner  => 'ubuntu',
        group  => 'ubuntu',
    }

    file { '/data/web_static/shared/':
        ensure => 'directory',
        owner  => 'ubuntu',
        group  => 'ubuntu',
    }



    file_line { 'nginx_config_for_hbnb_static':
        path  => '/etc/nginx/sites-available/default',
        line  => "\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}",
        after => '^\troot /var/www/html;',
        require => Package['nginx'],
    }

}


include web_static_setup