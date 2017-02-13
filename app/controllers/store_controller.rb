class StoreController < ApplicationController
  def index
    @products = Product.order("title asc").all
  end
end
