require 'rails_helper'

RSpec.describe 'Creating a new product', type: :feature do
  let!(:product) { create(:product, id: 13) }

  scenario 'User creates a new product' do
    visit '/products/new'

    fill_in 'Name', with: 'New Product'
    fill_in 'Description', with: 'This is a new product'
    fill_in 'Price', with: '9.99'
    fill_in 'Balance', with: '666'

    click_button 'Create Product'

    expect(page).to have_content('Product was successfully created.')
    expect(page).to have_content('New Product')
    expect(page).to have_content('This is a new product')
    expect(page).to have_content('9.99')
    expect(page).to have_content('666')
  end

  scenario 'Entering no data in new product' do
    visit '/products/new'

    click_button 'Create Product'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'User edit a new product' do
    visit "/products/13/edit"

    fill_in 'Name', with: 'Edited Product'
    fill_in 'Description', with: 'This is a edited product'
    fill_in 'Price', with: '50.05'
    fill_in 'Balance', with: '665'

    click_button 'Update Product'

    expect(page).to have_content('Product was successfully updated.')
    expect(page).to have_content('Edited Product')
    expect(page).to have_content('This is a edited product')
    expect(page).to have_content('50.05')
    expect(page).to have_content('665')
  end
end
