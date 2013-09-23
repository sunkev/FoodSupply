require 'spec_helper'

feature 'User can make an inventory', %Q{
  As a food service employee
  I want to receive inventory
  So that it can be recorded that we have food items
} do

  # Acceptance Criteria:

  #   I must specify a title, description, and quantity of the food item
  #   If I do not specify the required information, I am prompted to fix errors and to resubmit
  #   If I specify the required information, my inventory entry is recorded.

  scenario 'User makes successful inventory' do
    visit new_inventories_path
    fill_in 'Title', with: 'Tasty fish'
    fill_in 'Description', with: 'VERY TASTY'
    fill_in 'Quantity', with: 1337
    click__button('Create Inventory')
    expect(page).to have('Inventory was created!')
  end
end