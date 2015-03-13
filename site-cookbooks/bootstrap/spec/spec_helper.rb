require 'chefspec'
require 'chefspec/librarian'
require 'fauxhai'

RSpec.configure do |_config|
end

at_exit { ChefSpec::Coverage.report! }
