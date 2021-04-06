require 'rails_helper'

RSpec.feature "Visitor login", type: :feature, js: true do

  # SETUP
  before :each do
    User.create!(
      first_name: 'Angel',
      last_name: 'Sinn',
      email: 'angel@jungle.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario "Authenticated users are directed to home page" do
    # ACT
    visit root_path
    expect(page).to have_content 'Login'

    save_screenshot

    click_on 'Login'
    expect(page).to have_css 'form'

    save_screenshot

    fill_in 'email', with: 'angel@jungle.com'
    fill_in 'password', with: 'password'
    click_on 'Submit'

    # VERIFY
    expect(page).to have_content 'Logout'

    save_screenshot
  end

end