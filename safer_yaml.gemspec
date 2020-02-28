lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "safer_yaml/version"

Gem::Specification.new do |spec|
  spec.name          = "safer_yaml"
  spec.version       = SaferYaml::VERSION
  spec.authors       = ["Shane Becker"]
  spec.email         = ["veganstraightedge@gmail.com"]

  spec.summary       = %q{A simple way to safely load a YAML file}
  spec.description   = %q{SaferYAML reads a file from a path and uses YAML.safe_load to safely load its contents and optionally works with Rails.root}
  spec.homepage      = "https://github.com/hoverinc/safer_yaml"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hoverinc/safer_yaml"
  spec.metadata["changelog_uri"]   = "https://github.com/hoverinc/hyperion/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
