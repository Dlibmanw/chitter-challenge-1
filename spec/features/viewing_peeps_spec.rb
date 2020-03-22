feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter home page"
  end

  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "3rd day of isolation!"
    expect(page).to have_content "Sunny day"
    expect(page).to have_content "Way too much screen time"

  end

end
