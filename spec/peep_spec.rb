require 'peep'
require 'database_helpers'
describe 'Peep' do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_peeps1_test')
      peep = Peep.create(text: '3rd day of isolation!')
      Peep.create(text: 'Sunny day')
      Peep.create(text: 'Way too much screen time')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq '3rd day of isolation!'
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

  describe '.delete' do
    it 'removes a peep' do
      peep = Peep.create(text: 'A new post to test my Delete button')
      persisted_data = persisted_data(id: peep.id)
      Peep.delete(id: peep.id)
      expect(Peep.all.length).to eq 0
    end
  end

  describe '.edit' do
    it 'update a peep' do
      peep = Peep.create(text: 'A new post to test my Edit button')
      updated_peep = Peep.update(id: peep.id, text: 'Edited!')

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq peep.id
      expect(updated_peep.text).to eq 'Edited!'

    end
  end

  describe '.find' do
    it 'return a specificied peep object' do
      peep = Peep.create(text: 'Using the new find method!')
      the_post_Im_looking_for = Peep.find(id: peep.id)
      expect(the_post_Im_looking_for).to be_a Peep
      expect(the_post_Im_looking_for.id).to eq peep.id
      expect(the_post_Im_looking_for.text).to eq 'Using the new find method!'
    end
  end

end
