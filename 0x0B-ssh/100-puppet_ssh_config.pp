# make changes to config file using Puppet



file { '/etc/ssh/ssh_config':
  
  ensure => present,
  content=> '
      Host *
      	PasswordAuthentication no
      	IdentityFile ~/.ssh/school
  ',
  owner  => 'root',
  group  => 'root',

}
