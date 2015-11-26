class profiles::puppetsonarrunner  {
  $sonarqube_server = 'http://localhost:9000'
  $jdbc             = {
    url            => 'jdbc:h2:tcp://localhost:9092/sonar',
    username       => 'sonar',
    password       => 'sonar',
  }
  include java
  class { 'sonarqube::runner':
    sonarqube_server => $sonarqube_server,
    jdbc             => $jdbc,
  }
  file {'/etc/sonarrunner':
    ensure => directory,
  }
}

