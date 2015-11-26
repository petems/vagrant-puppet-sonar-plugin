class profiles::modules_list {

  # Just run it on the main directory for now
  codeanalysis { '/etc/puppetlabs/code/environments/production/modules':
    projectkey      => 'my-puppet-code-base',
    projectname     => 'My Puppet Code Base',
    project_version => '1.0',
  }

}
