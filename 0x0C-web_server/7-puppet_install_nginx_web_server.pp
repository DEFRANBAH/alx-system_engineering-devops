#!/usr/bin/env bash
# Configure server using puppet

# defines a Puppet class called nginx_server that 
#  encapsulates the configuration for the Nginx server

  package { 'nginx':
    ensure => installed,
  }

#  manages the Nginx service.
  service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
  }
# manages the Nginx configuration file located at /etc/nginx/sites-available/default.
  file { '/etc/nginx/sites-available/default':
    ensure  => present,
    content => "
      server {
        listen      80 default_server;
        listen      [::]:80 default_server;
        root        /var/www/html;
        index       index.html index.htm;

        location / {
          return 200 'Hello World!';
        }

        location /redirect_me {
          return 301 http://kevinocholah.wixsite.com/2023/;
        }
      }
    ",
    notify  => Service['nginx'],
  }
