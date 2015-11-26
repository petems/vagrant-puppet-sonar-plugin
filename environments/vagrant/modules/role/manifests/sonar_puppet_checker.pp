class role::sonar_puppet_checker {
  include profiles::sonar
  include profiles::puppetsonarrunner
  include profiles::modules_list

  Class['profiles::sonar'] ->
  Class['profiles::puppetsonarrunner'] ->
  Class['profiles::modules_list']
}