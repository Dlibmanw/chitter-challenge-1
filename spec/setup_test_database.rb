require 'pg'
p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'chitter_peeps1_test')
  connection.exec("TRUNCATE peeps;")
end
