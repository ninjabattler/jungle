require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations:' do
    describe "New Product" do
      it "should have save" do
        @product = Product.new({name: 'soap', description: 'washes stuff', category_id: 1, quantity: 5, image: 'nononono', price: 999}).save
        expect(@product).to eq(true)
      end
      it "should have fail if not given a name" do
        @product = Product.new({name: nil, description: 'washes stuff', category_id: 1, quantity: 5, image: 'nononono', price: 999})
        expect(@product.name).to eq(nil)
        expect(@product.id).to eq(nil)
      end
      it "should have fail if not given a price" do
        @product = Product.new({name: 'asd', description: 'washes stuff', category_id: 1, quantity: 5, image: 'nononono', price: nil})
        expect(@product.price).to eq(nil)
        expect(@product.id).to eq(nil)
      end
      it "should have fail if not given a quantity" do
        @product = Product.new({name: 'nil', description: 'washes stuff', category_id: 1, quantity: nil, image: 'nononono', price: 999})
        expect(@product.quantity).to eq(nil)
        expect(@product.id).to eq(nil)
      end
      it "should have fail if not given a category" do
        @product = Product.new({name: 'nil', description: 'washes stuff', category_id: nil, quantity: 5, image: 'nononono', price: 999})
        expect(@product.category_id).to eq(nil)
        expect(@product.id).to eq(nil)
      end
    end
  end
end