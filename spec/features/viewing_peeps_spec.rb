feature 'viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter home page"
  end

  scenario 'A user can see peeps' do
    visit('/peeps')
    expect(page).to have_content "Having a chilled weekend"
    expect(page).to have_content "2nd day of isolation"
    expect(page).to have_content "Coffee time"

  end

end
