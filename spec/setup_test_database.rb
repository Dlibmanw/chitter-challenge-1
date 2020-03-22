require 'pg'
p "Setting up test database..."
connection = PG.connect(dbname: 'chitter_peeps1_test')
connection.exec("TRUNCATE peeps;")