feature 'updating a peep' do
  scenario 'a user can update a peep' do
    peep = Peep.create(text: 'time to update some posts')
    visit('/peeps')
    expect(page).to have_content 'time to update some posts'
    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/peeps/#{peep.id}/edit"
    fill_in('text', with: 'This is my up-to-date peep')
    click_button('Submit')
    expect(current_path).to eq "/peeps"
    expect(page).to have_content 'This is my up-to-date peep'
    expect(peep).not_to have_content 'time to update some posts'
  end
end
