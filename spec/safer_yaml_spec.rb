RSpec.describe SaferYAML do
  describe 'Administrivia' do
    it 'has a version number' do
      expect(SaferYAML::VERSION).not_to be nil
    end

    it 'has the correct class name' do
      expect(described_class.name).to eq('SaferYAML')
    end
  end
end
