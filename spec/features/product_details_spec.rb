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

  scenario "They can view product details by clicking the details button" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    expect(page).to have_css 'article.product'
    
    first('article.product').click_link 'Details »'
    sleep 1
    save_screenshot
    expect(page.has_css?('.products-show'))

  end

  scenario "They can view product details by clicking the product" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    expect(page).to have_css 'article.product'
    
    first('article.product').click
    sleep 1
    save_screenshot
    expect(page.has_css?('.products-show'))

  end

end