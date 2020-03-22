feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter home page"
  end

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_peeps1_test')
    connection.exec("INSERT INTO peeps (text) VALUES('3rd day of isolation, almost done');")
    connection.exec("INSERT INTO peeps (text) VALUES('Sunny week');")
    connection.exec("INSERT INTO peeps (text) VALUES('Way too much screen time today');")
    visit('/peeps')
    expect(page).to have_content "3rd day of isolation, almost done"
    expect(page).to have_content "Sunny week"
    expect(page).to have_content "Way too much screen time today"

  end

end
