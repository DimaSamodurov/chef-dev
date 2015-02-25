# Ruby development environment configuration scripts and instructions.

Read https://github.com/DimaSamodurov/chef-dev/blob/master/doc/vm-setup.md
for step-by-step instructions installing Ubuntu Linux Virtual Machine.

## How to use

Clone the repo e.g. to chef-dev directory

    git clone https://github.com/DimaSamodurov/chef-dev.git

Install cookbooks

    cd chef-dev
    librarian-chef install

Run chef solo

    rvmsudo chef-solo -c solo.rb


