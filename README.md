ТУТ БУВ ОРЕСТ
# Instructions and scripts to setup Ruby development environment.

Tested on Ubuntu Linux 14.10

1. Install Linux system

 - Install Oracle Virtual Box
 - Create a new VM "Ubuntu-dev": 2G Memory, 64G Disk, enable 3d acceleration.
 - Install Ubuntu Desktop, choose LVM for disk partitioning.
    - Specify user 'dev', pwd '...'.
    - Optionally encrypt home directory.
    - Install Language Support if prompted.
    - Install VirtualBox guest additions.
    - Verify 3d acceleration is on (http://askubuntu.com/questions/477738/can-not-enable-3d-acceleration-on-ubuntu-14-04-inside-virtualbox):

        /usr/lib/nux/unity_support_test -p

    - Optionally enable swap: https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04
      disable encrypted swap partitions

        sudo nano /etc/fstab
        # and comment encrypted partitions if any

    - Do not ask for password running sudo.

        sudo visudo
        #add line
        dev ALL=(ALL) NOPASSWD: ALL

    - Install git.

        sudo apt-get install git

    - Configure git.

        # personalise
        git config --global user.name "Your Name"
        git config --global user.email "youremail@domain.com"
        #
        # generate ssh key
        ssh-keygen -t rsa -C "name of the key"
        # add public key to your Github account if not added yet.

    - Install RVM, Ruby, Rails.

        # Avoid doc generation when installing gems
        echo 'gem: --no-ri --no-rdoc' >> .gemrc

        # Prerequisite tool to load files
        sudo apt-get install curl

        # Add key
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        # Install RVM
        \curl -sSL https://get.rvm.io | bash -s stable --rails

        # Libraries beloaw are installed by RVM:
        # Installing required packages: gawk, libreadline6-dev, zlib1g-dev, libssl-dev, libyaml-dev,
        # libsqlite3-dev, sqlite3, autoconf, libgdbm-dev, libncurses5-dev, automake, libtool, bison, libffi-dev

        # Tweak below is required in order to automatically source RVM in shell
        echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*' >> ~/.bashrc

    - Install Chef

        # Chef client
         curl -L https://www.chef.io/chef/install.sh | sudo bash

    - Provision with chef:
    
        cd ~
        git clone git@github.com:DimaSamodurov/chef-dev.git
        cd ~/chef-dev
        bundle
        librarian-chef install
        sudo chef-solo -c solo.rb
        # The following packages will be installed:
            Java

2. Install Productivity tools

    - Terminator (enhanced terminal)

        sudo apt-get install terminator

    - DoubleCommander (analogue of TotalCommander): http://sourceforge.net/p/doublecmd/wiki/Download/

        sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Alexx2000/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/doublecmd-qt.list"
        sudo apt-get update
        sudo apt-get install doublecmd-qt

    - RubyMine

        # Download RubyMine archive from https://www.jetbrains.com/ruby/download/
        # extract to e.g. /opt/RubyMine-7.0.4
        # Note: RubyMine requires java which was installed previously using chef.
        # Install:
        cd /opt/RubyMine-7.0.4/bin
        ./rubymine.sh


