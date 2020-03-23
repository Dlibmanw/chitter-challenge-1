feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter home page"
  end

  scenario 'A user can see peeps' do
    Peep.create('3rd day of isolation, almost done')
    Peep.create('Sunny week')
    Peep.create('Way too much screen time today')
    visit('/peeps')
    expect(page).to have_content "3rd day of isolation, almost done"
    expect(page).to have_content "Sunny week"
    expect(page).to have_content "Way too much screen time today"

  end

end
