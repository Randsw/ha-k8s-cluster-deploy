# -*- mode: ruby -*-
# vi: set ft=ruby :
$k8s_master_num = 3
$k8s_worker_num = 3
$k8s_gw_num = 2
Vagrant.configure("2") do |config|
    config.vm.box = "generic/ubuntu1804"
    config.vm.box_check_update = false
    (1..($k8s_master_num + $k8s_worker_num)).each do |i|
        if i < $k8s_master_num + 1
            config.vm.define "master#{i}" do |node|
                node.vm.network "public_network", ip: "192.168.1.#{130+i}", bridge: "wlxbcf685653648"
                node.vm.hostname = "master#{i}"
                node.vm.provider "virtualbox" do |vb|
                    vb.gui = false
                    vb.memory = "2048"
                    vb.cpus=2
                end
                #node.vm.provision "ansible" do |ansible|
                #    ansible.verbose = "v"
                #    ansible.playbook = "k8s-cluster-prepare.yml"
                #end
            end
        end
        if i > $k8s_master_num
            config.vm.define "worker#{i-$k8s_worker_num}" do |node|
                node.vm.network "public_network", ip: "192.168.1.#{130+i}", bridge: "wlxbcf685653648"
                node.vm.hostname = "worker#{i-$k8s_worker_num}"
                node.vm.provider "virtualbox" do |vb|
                    vb.gui = false
                    vb.memory = "1024"
                    vb.cpus = 1
                end
                #node.vm.provision "ansible" do |ansible|
                #    ansible.verbose = "v"
                #    ansible.playbook = "k8s-cluster-prepare.yml"
                #end
            end
        end
    end
    (1..($k8s_gw_num)).each do |j|
        config.vm.define "gw#{j}" do |gw|
            gw.vm.network "public_network", ip: "192.168.1.#{130 + $k8s_master_num + $k8s_worker_num+j}", bridge: "wlxbcf685653648"
            gw.vm.hostname = "gw#{j}"
            gw.vm.provider "virtualbox" do |vb|
                vb.gui = false
                vb.memory = "1024"
                vb.cpus = 1
            end
        end
    end
end
