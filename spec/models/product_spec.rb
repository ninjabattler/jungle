require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations:' do
    describe "New Product" do
      it "should save" do
        @product = Product.new({name: 'soap', description: 'washes stuff', category_id: 1, quantity: 5, image: 'nononono', price: 999}).save
        expect(@product).to eq(true)
      end
      it "should have fail if not given a name" do
        @product = Product.create({name: nil, description: 'washes stuff', category_id: 1, quantity: 5, image: 'nononono', price: 999})
        expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
        expect(@product.save).to eq(false)
      end
      it "should have fail if not given a price" do
        @product = Product.create({name: 'asd', description: 'washes stuff', category_id: 1, quantity: 5, image: 'nononono', price: nil})
        expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
        expect(@product.save).to eq(false)
      end
      it "should have fail if not given a quantity" do
        @product = Product.create({name: 'nil', description: 'washes stuff', category_id: 1, quantity: nil, image: 'nononono', price: 999})
        expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
        expect(@product.save).to eq(false)
      end
      it "should have fail if not given a category" do
        @product = Product.create({name: 'nil', description: 'washes stuff', category_id: nil, quantity: 5, image: 'nononono', price: 999})
        expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
        expect(@product.save).to eq(false)
      end
    end
  end
end