require 'peep'

describe 'Peep' do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_peeps1_test')
      connection.exec("INSERT INTO peeps (text) VALUES('3rd day of isolation!');")
      connection.exec("INSERT INTO peeps (text) VALUES('Sunny day');")
      connection.exec("INSERT INTO peeps (text) VALUES('Way too much screen time');")
      peeps = Peep.all
      expect(peeps).to include("3rd day of isolation!")
      expect(peeps).to include("Sunny day")
      expect(peeps).to include("Way too much screen time")
    end
  end

end