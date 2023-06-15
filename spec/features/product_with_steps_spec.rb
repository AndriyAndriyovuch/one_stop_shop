require 'rails_helper'

RSpec.describe 'Creating a new product', type: :feature do
  let!(:product) { create(:product, id: 13) }

  Steps "User creates a new product" do
    When "User goes to new product page" do
      visit '/products/new'
    end

    And "I fill in right name" do
      fill_in 'Name', with: 'New Product'
    end
    And "I fill in  right description" do
      fill_in 'Description', with: 'This is a new product'
    end
    And "I fill in right price" do
      fill_in 'Price', with: '9.99'
    end
    And "I fill in  right balance" do
      fill_in 'Balance', with: '666'
    end
    And "I click create" do
      click_button 'Create Product'
    end

    Then "I should see notice" do
      expect(page).to have_content('Product was successfully created.')
    end
    Then "I should see name" do
      expect(page).to have_content('New Product')
    end
    Then "I should see description" do
      expect(page).to have_content('This is a new product')
    end
    Then "I should see price" do
      expect(page).to have_content('9.99')
    end
    Then "I should see balance" do
      expect(page).to have_content('666')
    end
  end

  Steps "Entering no data in new product" do
    When "User goes to new product page" do
      visit '/products/new'
    end

    And "I click create" do
      click_button 'Create Product'
    end

    Then "I should see notice" do
      expect(page).to have_content("Name can't be blank")
    end
  end

  Steps "User edit existing product" do
    When "User goes to edit product page" do
      visit "/products/13/edit"
    end

    And "I fill in name" do
      fill_in 'Name', with: 'Edited Product'
    end
    And "I fill in description" do
      fill_in 'Description', with: 'This is an edited product'
    end
    And "I fill in price" do
      fill_in 'Price', with: '50.05'
    end
    And "I fill in balance" do
      fill_in 'Balance', with: '500'
    end
    And "I click create" do
      click_button 'Update Product'
    end

    Then "I should see notice" do
      expect(page).to have_content('Product was successfully updated.')
    end
    Then "I should see name" do
      expect(page).to have_content('Edited Product')
    end
    Then "I should see description" do
      expect(page).to have_content('This is an edited product')
    end
    Then "I should see price" do
      expect(page).to have_content('50.05')
    end
    Then "I should see balance" do
      expect(page).to have_content('500')
    end
  end
end
