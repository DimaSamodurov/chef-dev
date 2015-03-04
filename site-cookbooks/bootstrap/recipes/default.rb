%w(build-essential openssl libssl-dev libxml2-dev libxslt-dev autoconf automake).each do |pkg|
  package pkg
end

package 'nodejs'
