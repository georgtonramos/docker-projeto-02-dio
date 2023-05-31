# -*- mode: ruby -*-
# vi: set ft=ruby  :

machines = {
  "master" => {"memory" => "1024", "cpu" => "1", "ip" => "51", "image" => "ubuntu/focal64", "disk" => "20GB"},
  "node01" => {"memory" => "1024", "cpu" => "1", "ip" => "52", "image" => "ubuntu/focal64", "disk" => "10GB"},
  "node02" => {"memory" => "1024", "cpu" => "1", "ip" => "53", "image" => "ubuntu/focal64", "disk" => "10GB"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "10.10.0.#{conf["ip"]}"
      machine.vm.disk :disk, size:"#{conf["disk"]}", primary: true
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]  
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "docker.sh"
      
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end

    end
  end
end