$:.push File.expand_path("../lib", __FILE__)
require 'omniship/version'

Gem::Specification.new do |s|

  s.name              = 'omniship'
  s.version           = OmniShip::VERSION
  s.date              = '2010-11-27'
  s.rubyforge_project = 'omniship'

  s.summary     = "OmniShip is a unified API for various shipping APIs."
  s.description = "OmniShip is a unified API for various shipping APIs such as UPS, USPS, FedEx, and DHL."

  s.authors  = ["Tom Preston-Werner", "Casey Juan Lopez", "Kevin Solkowski"]
  s.email    = 'casey@wantable.com'
  s.homepage = 'http://github.com/wantable/omniship'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[LICENSE README.md]

  s.add_dependency('json')
  s.add_dependency('curb')
  s.add_dependency('rest-client')
  s.add_dependency('nokogiri')
  s.add_development_dependency('rspec')

  # = MANIFEST =
  s.files =  Dir.glob("{lib}/**/*") + %w(LICENSE README.md)
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
