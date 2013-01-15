require 'chefspec'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.before(:each) do
    @runner = ChefSpec::ChefRunner.new
  end
end
