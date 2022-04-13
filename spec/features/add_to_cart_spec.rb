require 'rails_helper'

RSpec.feature "Cart increases by 1 when a visitor clicks 'Add to Cart'", type: :feature, js: true do
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
  scenario "They see cart increase" do
    visit root_path

    click_button 'Add'
    
    # commented out b/c it's for debugging only
    # save_screenshot

    expect(page).to have_content("My Cart (1)")
  end
end
