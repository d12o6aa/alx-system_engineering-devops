# Creates a file
file { '/tmp/school':
  ensure   => file,
  path     => '/tmp/school',
  mod      => '0744',
  owner    => 'www-data',
  group    => 'www-data',
  contions => 'I love Puppet'
}
