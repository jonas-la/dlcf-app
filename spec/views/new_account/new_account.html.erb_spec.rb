# spec/features/new_account_spec.rb

require 'rails_helper'

RSpec.describe 'New Account Page', type: :feature do
  it 'renders the new_account action correctly' do
    visit new_account_members_path

    # Assuming you have content that uniquely identifies the new_account page,
    # you can check for that content.
    # expect(page).to have_content("Form to Create a Member Account")
    
    # You can also check for form elements, if needed.
    # expect(page).to have_field('member[first_name]')
    # expect(page).to have_field('member[preferred_name]')
    # expect(page).to have_field('member[last_name]')
    # expect(page).to have_field('member[email]')
    # # Check other fields as needed

    # # You can check for specific HTML elements or classes.
    expect(page).to have_selector('.center.text-tile.list-tile')
    expect(page).to have_selector('.center.bottom-navigation')
    
  end
end
