## Installing Linux VM from the scratch

Current version: Linux 14.10
Note: use 32 bit version if your worksatation or laptop does not support hardware virtualization.
Often hardware virtualization is disabled in BIOS, consider enabling it.


- Install Oracle Virtual Box
- Create a new VM "Ubuntu-dev": 1G Memory, 64G Dynamically allocated Disk, enable 3d acceleration.
    - Install Ubuntu Desktop
    - Specify user 'dev', pwd '...'.
    - Install Language Support if prompted.
- Install VirtualBox guest additions
    - If you have a problem (not working clipboard, not connect cd-rom guest additions, etc.), first of all, install dkms:

        sudo apt-get install virtualbox-guest-dkms

- Check that Ubuntu looking to upgrade on the main server
- Verify 3d acceleration is turned on

        /usr/lib/nux/unity_support_test -p

- Do not ask for password running sudo

        sudo visudo
        #add line
        dev ALL=(ALL) NOPASSWD: ALL

- Configure Gnome terminal to run in login shell

        Check the 'Run command as login shell' checkbox on the Title and Command tab
        of gnome-terminal's Edit ▸ Profile Preferences menu dialog,
        in case the menu is missing right click the terminal app and navigate Profiles ▸ Profile Preferences.
        
        See screenshots here: https://rvm.io/integration/gnome-terminal
        
        Terminator users can find instructions here:
        http://askubuntu.com/questions/489099/use-login-shell-in-xubuntu-14-04
        just right-click inside the terminal window and select Preferences.
  
- Install RVM

        # Avoid doc generation when installing gems
        echo 'gem: --no-ri --no-rdoc' >> .gemrc
        sudo apt-get install -y git-core curl
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        \curl -sSL https://get.rvm.io | bash -s stable --ruby
        # Start RVM
        source /home/dev/.rvm/scripts/rvm

- Configure git

        # personalise
        git config --global user.name "Your Name"
        git config --global user.email "youremail@domain.com"
        #
        # generate ssh key, keep the default key names and path. 
        ssh-keygen -t rsa -C "name of the key"
        # here, you should have "~/.ssh/id_rsa" and "~/.ssh/id_rsa.pub" files.
        # check this by typing 'll ~/.ssh'
        
        # Then add public key to your Github account if not added yet.
        echo ~/.ssh/id_rsa.pub
        # Copy the output and paste to Github https://github.com/settings/ssh as a new key.
         

- Install Chef and tools

        sudo dpkg --configure -a
        git clone https://github.com/DimaSamodurov/chef-dev.git
        cd chef-dev
        sudo apt-get install bundler
        bundle

- Bootstrap the machine

        librarian-chef install
        rvmsudo chef-solo -c solo.rb


## Optionally Install Productivity tools

- RubyMine

        # Download RubyMine archive from https://www.jetbrains.com/ruby/download/
        # extract to e.g. /opt/RubyMine-7.0.4
        # Note: RubyMine requires java which was installed previously using chef.
        # Install:
        cd /opt/RubyMine-7.0.4/bin
        ./rubymine.sh


## Possible errors solutions

- MongoDB
       # Error: <Could not connect to a primary node for replica set 
       #<Moped::Cluster:70004983957780 @seeds=[<Moped::Node resolved_address="127.0.0.1:27017">]>
       
       #Solution:
        
       #Stop mongodb service
       sudo service mongodb stop
        
       #Remove mongodb lock file
       sudo rm /var/lib/mongodb/mongod.lock
        
       #Change ownership from root to mongodb path
       sudo chown -R mongodb:mongodb /var/lib/mongodb/
        
       #Start mongodb service
       sudo service mongodb start
        
       #Test mongo app
       mongo
