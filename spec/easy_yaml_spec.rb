RSpec.describe EasyYAML do
  describe 'Administrivia' do
    it 'has a version number' do
      expect(EasyYAML::VERSION).not_to be_nil
    end

    it 'has the correct class name' do
      expect(described_class.name).to eq('EasyYAML')
    end
  end

  describe '.load' do
    let(:yaml_examples_dir) { '../../spec/examples' }

    it 'returns a hash' do
      subject = described_class.load("#{yaml_examples_dir}/simple.yml")
      expect(subject).to be_a Hash
    end

    it 'accepts a relative_to_rails_root argument' do
      subject = described_class.load("#{yaml_examples_dir}/simple.yml", relative_to_rails_root: false)
      expect(subject).to be_a Hash
    end

    it 'accepts a allow_aliases argument' do
      subject = described_class.load("#{yaml_examples_dir}/simple.yml", allow_aliases: false)
      expect(subject).to be_a Hash
    end

    it 'accepts both relative_to_rails_root and allow_aliases arguments' do
      subject = described_class.load("#{yaml_examples_dir}/simple.yml", relative_to_rails_root: false, allow_aliases: false)
      expect(subject).to be_a Hash
    end
  end
end
