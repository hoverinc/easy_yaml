require 'easy_yaml/version'
require 'easy_yaml/yaml_loader'

module EasyYAML
  class << self
    def for path, allow_aliases: true, allow_erb: true, relative_to_rails_root: true
      loaded_yaml = EasyYAML::YAMLLoader.new path,
                                             allow_aliases:          allow_aliases,
                                             allow_erb:              allow_erb,
                                             relative_to_rails_root: relative_to_rails_root

      loaded_yaml.to_h
    end
  end
end
