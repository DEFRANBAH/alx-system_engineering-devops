#Using Puppet to create a manifest that kills a process named killmenow.
#This is a simple example of how to use Puppet to manage processes.
exec { 'pkill killmenow':
  path   => '/usr/bin:/usr/sbin:/bin',
  onlyif => 'pgrep killmenow',
}

