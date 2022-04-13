require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
  end
  scenario "They see product details" do
    visit root_path

    find('a.btn-default').click
    
    # commented out b/c it's for debugging only
    # save_screenshot

    expect(page).to have_content('Description')
  end
end
