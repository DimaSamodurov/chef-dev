#- Location for mongodb data directory, defaults to "/var/lib/mongodb"
default['mongodb']['config']['dbpath'] = '/data/mongodb'
# - Enable the ReST interface of the webserver
default['mongodb']['config']['rest'] = true
# - Modify MongoDB to use a smaller default data file size
default['mongodb']['config']['smallfiles'] = true
# - Specifies a maximum size in megabytes for the replication operation log
default['mongodb']['config']['oplogsize']
# Configure from which address to accept connections
default['mongodb']['config']['bind_ip'] = '127.0.0.1'
