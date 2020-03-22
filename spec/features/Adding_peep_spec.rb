feature 'Adding a new peep' do
  scenario 'a user can add a peep' do
    visit('/peeps/new')
    fill_in('text', with: 'A new peep by me')
    click_button('Submit')
    expect(page).to have_content('A new peep by me')
  end
end