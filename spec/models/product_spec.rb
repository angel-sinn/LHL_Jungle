require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    context 'given a product name, price, quantity and category that is not blank' do
      it 'is a valid product' do
        @category = Category.create(name: "Furniture")
        @product = Product.new(name: "Massage Chair", price: 5000, quantity: 1, category: @category)
        expect(@product).to be_valid
      end
    end

    context 'given no product name' do
      it 'is not a valid product' do
        @category = Category.create(name: "Furniture")
        @product = Product.new(name: nil, price: 5000, quantity: 1, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'given no product price' do
      it 'is not a valid product' do
        @category = Category.create(name: "Furniture")
        @product = Product.new(name: "Massage Chair", price: nil, quantity: 1, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'given no product quantity' do
      it 'is not a valid product' do
        @category = Category.create(name: "Furniture")
        @product = Product.new(name: "Massage Chair", price: 5000, quantity: nil, category: @category)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'given no product category' do
      it 'is not a valid product' do
        @category = Category.create(name: "Furniture")
        @product = Product.new(name: "Massage Chair", price: 5000, quantity: 1, category: nil)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end
