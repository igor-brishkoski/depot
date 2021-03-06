class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
  	@products = Product.order(:title)
    increment_count
  end

  private

  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1

    @view_count = session[:counter]
  end
end
