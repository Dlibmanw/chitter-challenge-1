require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("3rd day of isolation!")
      expect(peeps).to include("Sunny day")
      expect(peeps).to include("Way too much screen time")
    end
  end

end
