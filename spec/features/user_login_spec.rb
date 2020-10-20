require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  before :each do
    @user = User.create!({email: 'teeeee@gam.com', first_name: 'no', last_name: 'way', password: 'MEME', password_confirmation: 'MEME'})
  end

  scenario "They can log in" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    click_link 'Login'
    sleep 1
    fill_in "email", with: "teeeee@gam.com"
    fill_in 'password', with: 'MEME'
    first('.btn-primary').click
    sleep 1
    expect(page).to have_content('Signed in as no way')
  end

end