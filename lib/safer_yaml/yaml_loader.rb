require 'yaml'
require 'erb'

module SaferYAML
  class YAMLLoader
    def initialize path, relative_to_rails_root: true, allow_aliases: true, allow_erb: true
      @path                   = path
      @relative_to_rails_root = relative_to_rails_root
      @allow_aliases          = allow_aliases
    end

    def to_h
      safe_load
    end

    private

    def yaml_file
      File.read(@path)
    end

    def erb_parsed_yaml
      ERB.new(yaml_file).result
    end

    def safe_load
      YAML.safe_load(erb_parsed_yaml, aliases: @allow_aliases)
    end
  end
end
