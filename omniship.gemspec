Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.6'

  s.name              = 'omniship'
  s.version           = '0.0.1'
  s.date              = '2010-11-27'
  s.rubyforge_project = 'omniship'

  s.summary     = "OmniShip is a unified API for various shipping APIs."
  s.description = "OmniShip is a unified API for various shipping APIs such as UPS, FedEx, and DHL."

  s.authors  = ["Tom Preston-Werner"]
  s.email    = 'tom@mojombo.com'
  s.homepage = 'http://github.com/mojombo/omniship'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[LICENSE README.md]

  s.add_dependency('handsoap', [">= 1.1.7", "< 2.0.0"])

  s.add_development_dependency('shoulda', [">= 2.11.3", "< 3.0.0"])

  # = MANIFEST =
  s.files = %w[
    README.md
    Rakefile
    lib/omniship.rb
    lib/omniship/ups.rb
    lib/omniship/ups/track.rb
    lib/omniship/ups/track/shipment.rb
    lib/omniship/ups/track_request.rb
    lib/omniship/ups/track_response.rb
    omniship.gemspec
    test/config.yml.example
    test/helper.rb
    test/test_ups_track.rb
  ]
  # = MANIFEST =

  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
