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
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text']) }

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

  def self.delete(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps1_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps1')
    end
    connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end

  def self.update(id:, text:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps1_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps1')
    end    
    result = connection.exec("UPDATE peeps SET text = '#{text}' WHERE id = '#{id}' RETURNING id, text")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end

  def self.find(id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps1_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps1')
    end
    result = connection.exec("SELECT * FROM peeps WHERE id = '#{id}'")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end
end
