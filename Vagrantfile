Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  
  # Enable SSH agent forwarding globally
  config.ssh.forward_agent = true

  ### DB vm ###
  config.vm.define "db01" do |db01|
    db01.vm.box = "eurolinux-vagrant/centos-stream-9"
    db01.vm.box_version = "9.0.43"
    db01.vm.hostname = "db01"
    db01.vm.network "private_network", ip: '192.168.56.10'
    db01.vm.provider "virtualbox" do |vb|
      vb.memory = "500"
    end
    db01.vm.provision "shell", path: "MySQL.sh"
  end

  ### MC vm ###
  config.vm.define "mc01" do |mc01|
    mc01.vm.box = "eurolinux-vagrant/centos-stream-9"
    mc01.vm.box_version = "9.0.43"
    mc01.vm.hostname = "mc01"
    mc01.vm.network "private_network", ip: "192.168.56.20"
    mc01.vm.provider "virtualbox" do |vb|
      vb.memory = "500"
    end
    mc01.vm.provision "shell", path: "Memcache.sh"
  end

  ### RMQ vm ###
  config.vm.define "rmq01" do |rmq01|
    rmq01.vm.box = "eurolinux-vagrant/centos-stream-9"
    rmq01.vm.box_version = "9.0.43"
    rmq01.vm.hostname = "rmq01"
    rmq01.vm.network "private_network", ip: "192.168.56.30"
    rmq01.vm.provider "virtualbox" do |vb|
      vb.memory = "500"
    end
    rmq01.vm.provision "shell", path: "RabbitMQ.sh"
  end

  ### APP vm ###
  config.vm.define "app01" do |app01|
    app01.vm.box = "eurolinux-vagrant/centos-stream-9"
    app01.vm.box_version = "9.0.43"
    app01.vm.hostname = "app01"
    app01.vm.network "private_network", ip: "192.168.56.40"
    app01.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
    app01.vm.provision "shell", path: "Tomcat.sh"
  end

  ### WEB vm ###
  config.vm.define "web01" do |web01|
    web01.vm.box = "ubuntu/jammy64"
    web01.vm.hostname = "web01"
    web01.vm.network "private_network", ip: "192.168.56.50"
    web01.vm.provider "virtualbox" do |vb|
      vb.memory = "1048"
    end
    web01.vm.provision "shell", path: "NGINX.sh"
  end
  