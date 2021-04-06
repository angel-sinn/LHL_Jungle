require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page from home page", type: :feature, js: true do

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

  scenario "They can navigate to relevant product detail page by clicking on the product title from home page" do
    # ACT
    visit root_path
    page.first('article.product').find('h4').click

    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'

    save_screenshot
  end

    scenario "They can navigate to relevant product detail page by clicking on the product detail button from home page" do
    # ACT
    visit root_path
    page.first('article.product').find('a.btn-default').click

    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'

    save_screenshot
  end
end