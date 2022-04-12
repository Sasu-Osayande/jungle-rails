require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "saves successfully with all four fields" do
      @category = Category.create(name: "Shoes")
      @product = Product.new(
        name: "boots",
        price_cents: 74.99,
        quantity: 9,
        category: @category
      )
      expect(@product).to be_valid
    end
    it "is invalid without a name" do
      @category = Category.create(name: "Shoes")
      no_name = Product.new(
        name: nil,
        price_cents: 74.99,
        quantity: 9,
        category: @category
      )
      expect(no_name).to_not be_valid
      expect(no_name.errors.full_messages).to include("Name can't be blank")
    end
    it "is invalid without a price" do
      @category = Category.create(name: "Shoes")
      no_price = Product.new(
        name: "boots",
        price_cents: nil,
        quantity: 9,
        category: @category
      )
      expect(no_price).to_not be_valid
      expect(no_price.errors.full_messages).to include("Price can't be blank")
    end
    it "is invalid without a quantity" do
      @category = Category.create(name: "Shoes")
      no_quantity = Product.new(
        name: "boots",
        price_cents: 74.99,
        quantity: nil,
        category: @category
      )
      expect(no_quantity).to_not be_valid
      expect(no_quantity.errors.full_messages).to include("Quantity can't be blank")
    end
    it "is invalid without a category" do
      @category = Category.create(name: "Shoes")
      no_category = Product.new(
        name: "boots",
        price_cents: 74.99,
        quantity: 9,
        category: nil
      )
      expect(no_category).to_not be_valid
      expect(no_category.errors.full_messages).to include("Category can't be blank")
    end
  end
end
