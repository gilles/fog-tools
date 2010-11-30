lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'fog/tools/version'
require 'fileutils'

Gem::Specification.new do |s|

  s.name                      = "fog-tools"
  s.version                   = Fog::Tools::VERSION
  s.platform                  = Gem::Platform::RUBY
  s.authors                   = ["Gilles Devaux"]
  s.email                     = ["gilles.devaux@gmail.com"]
  s.homepage                  = "http://github.com/gilles/fog-tools"
  s.summary                   = "A set of thor tasks for fog"
  s.description               = "fog-tools contains a set of thor tasks for ops or sysadmin"

  s.executables = ["fog-tools-install"]

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "fog-tools"

  s.add_dependency "thor", ">= 0.14.6"
  s.add_dependency "fog", ">= 0.3.5"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'

  s.post_install_message = <<-MESSAGE
"run fog-tools-install to install the thor tasks system wide"
  MESSAGE

end

#TODO find a way to do this
#rubygems_plugin is weird: it will look for one in every gem. Except fog-tools is not installed yet so it can't find the post_install hook
#Gem.post_install do
#  FileUtils.mkdir("~/.fog")
#  Gem.find_file('fog-tools/**/').each do |f|
#    puts f
#  end
#end
#
#Gem.post_uninstall do
#  FileUtils.rm_rf("~/.fog")
#end
