require 'pg'

class Peep
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps1_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps1')
    end
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['text'] }
  end

  def self.create(text:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps1_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps1')
    end
    connection.exec("INSERT INTO peeps (text) VALUES('#{text}');")
  end
end
