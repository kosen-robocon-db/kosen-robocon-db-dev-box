# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  if File.exist?( File.expand_path('../CREATION_FROM_DISTRO', __FILE__) )
    config.vm.box      = 'ubuntu/bionic64' # 18.04 LTS
  else
    config.vm.box = 'matthew_238/kosen-robocon-db-dev'
    config.vm.box_version = '0.0.1'
  end
  config.vm.hostname = 'robocon'
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provision :shell, path: 'bootstrap_root.sh'
  config.vm.provision :shell, path: 'bootstrap_user.sh', privileged: false
  config.vm.provider 'virtualbox' do |v|
    v.memory = ENV.fetch('RAILS_DEV_BOX_RAM', 2048).to_i
    v.cpus   = ENV.fetch('RAILS_DEV_BOX_CPUS', 2).to_i
  end
end
