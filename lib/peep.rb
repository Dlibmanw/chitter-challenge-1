require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_peeps1')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['peep'] }
  end
end
