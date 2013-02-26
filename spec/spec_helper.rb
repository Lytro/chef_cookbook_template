require 'chefspec'

Dir['./spec/support/**/*.rb'].sort.each {|f| require f}

# Chef normally defaults to the '_default' environment. For tests, run by default in the 'test' environment.
def runner(attributes = {}, environment = 'test')
  # A workaround so that ChefSpec can work with Chef environments (from https://github.com/acrmp/chefspec/issues/54)

  cookbook_paths = %W(#{File.expand_path('..', Dir.pwd)} #{File.expand_path(Dir.pwd)}/cookbooks)
  @runner ||= ChefSpec::ChefRunner.new(cookbook_path: cookbook_paths, platform: 'ubuntu', version: '10.04') do |node|
    env = Chef::Environment.new
    env.name environment
    node.stub(:chef_environment).and_return env.name
    Chef::Environment.stub(:load).and_return env

    attributes.each_pair do |key, val|
      node.set[key] = val
    end
  end
end
