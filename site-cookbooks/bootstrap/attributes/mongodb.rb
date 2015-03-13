
default['mongodb']['config']['dbpath'] = '/data/mongodb' #- Location for mongodb data directory, defaults to "/var/lib/mongodb"
default['mongodb']['config']['rest'] = true # - Enable the ReST interface of the webserver
default['mongodb']['config']['smallfiles'] = true # - Modify MongoDB to use a smaller default data file size
default['mongodb']['config']['oplogsize'] # - Specifies a maximum size in megabytes for the replication operation log
default['mongodb']['config']['bind_ip'] = '127.0.0.1' # Configure from which address to accept connections
