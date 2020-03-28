require 'pg'

class Peep
  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

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
    result = connection.exec("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end
end