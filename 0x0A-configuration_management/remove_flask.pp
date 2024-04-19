# already flask v3 exists, need to remove it first
package { 'python3-flask':
  ensure => 'absent',
}
