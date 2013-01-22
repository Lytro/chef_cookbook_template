require 'chefspec'
require 'fauxhai'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.before(:each) do
    # Change this to whatever OS you want to stub out, or move it into a before block if different spec files need different OSes.
    Fauxhai.mock(platform: 'ubuntu', version: '10.04')

    # Delete this next line and uncomment the two below it if you are using Librarian-Chef to download cookbooks and
    # want ChefSpec to test against stuff inside of those cookbooks

    @runner = ChefSpec::ChefRunner.new
    #cookbook_paths = %W(#{File.expand_path(Dir.pwd)}/cookbooks #{File.expand_path("..", Dir.pwd)})
    #@runner = ChefSpec::ChefRunner.new({cookbook_path: cookbook_paths})


    # Uncomment these lines if you want to stub the loading of cookbooks instead of actually sourcing them.

    #Chef::Recipe.any_instance.stub(:load_recipe).and_return do |arg|
    #  @runner.node.run_state[:seen_recipes][arg] = true
    #end
  end
end
