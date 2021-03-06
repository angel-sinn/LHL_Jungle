require 'rails_helper'

RSpec.feature "Visitor clicks on 'Add to Cart' button for a product on home page", type: :feature, js: true do

  # SETUP
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

  scenario "The number of cart items increases from 0 to 1" do
    # ACT
    visit root_path
    expect(page).to have_content 'My Cart (0)'

    save_screenshot

    page.first('article.product').click_on "Add"

    # # VERIFY
    expect(page).to have_content 'My Cart (1)'

    save_screenshot
  end

end