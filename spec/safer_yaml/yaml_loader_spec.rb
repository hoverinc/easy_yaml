RSpec.describe SaferYAML::YAMLLoader do
  describe '#new' do
    it 'requires a path argument' do
      subject = described_class.new('examples/simple.yml')
      expect(subject).to be_a described_class
    end

    it 'accepts a relative_to_rails_root argument' do
      subject = described_class.new('examples/simple.yml', relative_to_rails_root: false)
      expect(subject).to be_a described_class
    end

    it 'accepts a allow_aliases argument' do
      subject = described_class.new('examples/simple.yml', allow_aliases: false)
      expect(subject).to be_a described_class
    end

    it 'accepts both relative_to_rails_root and allow_aliases arguments' do
      subject = described_class.new('examples/simple.yml', relative_to_rails_root: false, allow_aliases: false)
      expect(subject).to be_a described_class
    end
  end

  describe '#to_h' do
    let(:simple_yaml_example_path) { Pathname.new File.expand_path('../examples/simple.yml', __dir__) }

    it 'returns a hash' do
      subject = described_class.new(simple_yaml_example_path).to_h
      expect(subject).to be_a Hash
    end

    context 'with simple YAML file' do
      it 'reads value from YAML key' do
        subject = described_class.new(simple_yaml_example_path).to_h
        expect(subject['name']).to eq 'Chicago Cubs'
      end
    end

    context 'with YAML file with an hash' do
      let(:array_yaml_example_path) { Pathname.new File.expand_path('../examples/hash.yml', __dir__) }

      it 'reads value from YAML key' do
        subject = described_class.new(array_yaml_example_path).to_h
        expect(subject['team']['name']).to eq 'Cubs'
      end
    end

    context 'with ERB in the YAML file' do
      let(:erb_in_yaml_example_path) { Pathname.new File.expand_path('../examples/erb.yml', __dir__) }
      let(:ruby_version) { RUBY_VERSION }

      it 'parses ERB inside YAML, then reads value from YAML' do
        subject = described_class.new(erb_in_yaml_example_path).to_h
        expect(subject['ruby']['version']).to eq ruby_version
      end
    end
  end
end
