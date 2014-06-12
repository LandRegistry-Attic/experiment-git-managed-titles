Vagrant.configure("2") do |config|
  config.vm.box = "saucy64"
  config.vm.provision "shell",
    inline: "sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions"
#  config.vm.provision "docker",
#    images: ["ubuntu"]
end
