lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_yaml/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.6.0'

  spec.name          = 'easy_yaml'
  spec.version       = EasyYAML::VERSION
  spec.authors       = ['Shane Becker']
  spec.email         = ['veganstraightedge@gmail.com']

  spec.summary       = 'A simple way to safely load a YAML file'
  spec.description   = <<~DESCRIPTION.tr("\n", ' ')
    EasyYAML reads a file from a path and uses YAML.safe_load to
    safely load its contents and optionally works with Rails.root
  DESCRIPTION
  spec.homepage      = 'https://github.com/hoverinc/easy_yaml'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/hoverinc/easy_yaml'
  spec.metadata['changelog_uri']   = 'https://github.com/hoverinc/hyperion/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
