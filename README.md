# Ruby development environment configuration scripts and instructions.

Read doc/vm-setup.md for step-by-step instructions installing Ubuntu Linux Virtual Machine.

## How to use


Clone the repo e.g. to chef-dev directory

        git clone git@github.com:DimaSamodurov/chef-dev.git

Install dependencies (librarian-chef)

        cd chef-dev
        bundle

Install required cookbooks

        bundle exec librarian-chef install

Optionally modify the run list and specify items you want to install

        nano node.json # enable and disable recipes here.

Run the recipes

        sudo bundle exec chef-solo -c solo.rb


