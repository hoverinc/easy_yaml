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
  end
end
