require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      expect(peeps).to include("Having a chilled weekend")
      expect(peeps).to include("2nd day of isolation")
      expect(peeps).to include("Coffee time")

    end
  end

end
