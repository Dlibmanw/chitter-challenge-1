feature 'Deleting a peep' do
  scenario 'a user can delete a peep' do
    Peep.create(text: 'This peep is about to be deleted')
    visit('/peeps')
    expect(page).to have_content('This peep is about to be deleted')
    first('.peep').click_button 'Delete'
    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('This peep is about to be deleted')
  end
end
