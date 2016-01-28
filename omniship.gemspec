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
  s.email    = 'casey@martigot.com'
  s.homepage = 'http://github.com/fiestacasey/omniship'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[LICENSE README.md]

  s.add_dependency('json')
  s.add_dependency('curb')
  s.add_dependency('rest-client')

  s.add_development_dependency('shoulda', [">= 2.11.3", "< 3.0.0"])

  # = MANIFEST =
  s.files =  Dir.glob("{lib}/**/*") + %w(LICENSE README.md)
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
