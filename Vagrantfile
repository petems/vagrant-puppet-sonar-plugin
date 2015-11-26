Vagrant.configure('2') do |config|
  config.vm.box = "puppetlabs/centos-6.6-64-puppet"

  config.vm.hostname = 'sonar.example.com'
  config.vm.network :forwarded_port, guest: 9000, host: 9444
  config.vm.provision :shell, :inline => 'puppet module install stahnma-epel'
  config.vm.provision :puppet do |puppet|
    puppet.environment_path = "environments"
    puppet.environment = "vagrant"
    # puppet.options = "--verbose --debug"
  end
  config.vm.provision :shell, :inline => 'cd /etc/sonarrunner/my-puppet-code-base; /usr/local/sonar-runner/bin/sonar-runner'
  config.vm.provision :shell, :inline => 'echo "Takes about 60 secs to start, yay Java!"'

  config.vm.provision :shell, :inline => 'echo Visit http://localhost:9444'
end
