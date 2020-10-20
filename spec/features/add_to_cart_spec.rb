require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add products to their cart by clicking the add button" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    expect(page).to have_css 'article.product'
    within('nav') do
      expect(page).to have_content 'My Cart (0)'
    end
    save_screenshot
    
    first('article.product > footer > form > button').click
    sleep 1
    within('nav') do
      expect(page).to have_content 'My Cart (1)'
    end
    save_screenshot

  end

end