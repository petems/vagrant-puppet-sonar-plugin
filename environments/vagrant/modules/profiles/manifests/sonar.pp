class profiles::sonar (
  $puppet_plugin_url = 'https://github.com/iwarapter/sonar-puppet/releases/download/1.1/sonar-puppet-plugin-1.1.jar',
  $puppet_toolkit_url = 'https://github.com/iwarapter/sonar-puppet/releases/download/1.1/sslr-puppet-toolkit-1.1.jar',
  $plugins_dir = '/var/local/sonar/extensions/plugins',
) {
  include ::java
  include ::maven::maven
  class {'::sonarqube':
    version => '4.5.5',
  }
  Class['::maven::maven'] -> Class['::sonarqube']
  remote_file { "${plugins_dir}/sonar-puppet-plugin-1.1.jar":
    ensure => present,
    source => $puppet_plugin_url,
    notify => Service['sonarqube'],
    require => File[$plugins_dir],
  }
  file { "${plugins_dir}/sonar-puppet-plugin-1.1.jar":
    owner  => 'sonar',
    group  => 'sonar',
    mode   => '0644',
    notify => Service['sonarqube'],
  }
  remote_file { "${plugins_dir}/sslr-puppet-toolkit-1.1.jar":
    ensure => present,
    source => $puppet_toolkit_url,
    notify => Service['sonarqube'],
  }
  file { "${plugins_dir}/sslr-puppet-toolkit-1.1.jar":
    owner  => 'sonar',
    group  => 'sonar',
    mode   => '0644',
    notify => Service['sonarqube'],
  }
  firewall { '100 allow connections to sonarqube':
    proto  => 'tcp',
    dport  => '9000',
    action => 'accept',
  }
}
