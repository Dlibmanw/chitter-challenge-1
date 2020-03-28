require 'peep'
require 'database_helpers'
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

  describe '.create' do
    it 'insert a new peep to the database' do
      peep = Peep.create(text: 'Testing my updated create method')
      persisted_data = persisted_data(id: peep.id)
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'Testing my updated create method'
    end
  end

end
