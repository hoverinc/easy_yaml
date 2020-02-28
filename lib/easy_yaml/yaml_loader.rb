require 'yaml'
require 'erb'

module EasyYAML
  class YAMLLoader
    def initialize path, allow_aliases: true, allow_erb: true, relative_to_rails_root: true
      @path                   = path
      @allow_aliases          = allow_aliases
      @allow_erb              = allow_erb
      @relative_to_rails_root = relative_to_rails_root
    end

    def to_h
      safe_load
    end

    private

    def normalized_path
      @path.tr('\\', '/').split('/')
    end

    def prefix_path
      ::Rails.root if @relative_to_rails_root && defined?(::Rails)
    end

    def yaml_file_path
      File.join [prefix_path, normalized_path].compact
    end

    def file_path
      Pathname.new File.expand_path(yaml_file_path, __dir__)
    end

    def yaml_file
      File.read file_path
    end

    def erb_parsed_yaml
      return yaml_file unless @allow_erb

      ERB.new(yaml_file).result
    end

    def safe_load
      YAML.safe_load(erb_parsed_yaml, aliases: @allow_aliases)
    end
  end
end
