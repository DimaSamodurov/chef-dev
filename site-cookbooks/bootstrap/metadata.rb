name 'bootstrap'
maintainer 'Dima Samodurov'
description 'Cookbook for local environment configuration for Ruby development.'
version '0.0.2'

supports 'ubuntu'

depends 'mongodb'
depends 'java'
depends 'imagemagick'

recipe 'bootstrap', 'Configures development machine'
