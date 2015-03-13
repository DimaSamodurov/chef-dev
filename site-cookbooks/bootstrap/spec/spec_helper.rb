require 'chefspec'
require 'chefspec/librarian'
require 'fauxhai'

RSpec.configure do |config|

end

at_exit { ChefSpec::Coverage.report! }
