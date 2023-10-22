# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "Master" do |master|
    master.vm.provider :docker do |docker|
      docker.image = "philemonnwanne/ubuntu-mod:20.04"
      docker.has_ssh = true
      docker.privileged = true
      docker.volumes = ["/sys/fs/cgroup:/sys/fs/cgroup:rw"]
      docker.create_args = ["--cgroupns=host"]
    end

    # Use Vagrant's built-in provisioning to copy and execute the shell script
    master.vm.provision "shell", path: "setup_lamp.sh"
  end

  config.vm.define "Slave" do |slave|
    slave.vm.provider :docker do |docker|
      docker.image = "philemonnwanne/ubuntu-mod:20.04"
      docker.has_ssh = true
      docker.privileged = true
      docker.volumes = ["/sys/fs/cgroup:/sys/fs/cgroup:rw"]
      docker.create_args = ["--cgroupns=host"]
    end
  end
end
