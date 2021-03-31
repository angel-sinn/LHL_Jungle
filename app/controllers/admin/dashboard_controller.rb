class Admin::DashboardController < ApplicationController

   http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @totalproducts = Product.count
    @totalcategories = Category.count
    @cat1 = Category.find_by(id: 1)
    @cat2 = Category.find_by(id: 2)
    @cat3 = Category.find_by(id: 3)
  end
end
