class StoreController < ApplicationController
  def index
    session[:counter] = ( session[:counter].nil? ? 0 : session[:counter] + 1 )

    @products = Product.order("title asc").all
  end
end
