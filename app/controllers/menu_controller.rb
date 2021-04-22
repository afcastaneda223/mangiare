class MenuController < ApplicationController
  def index
    @page = 'menu'
    @product = Product.all
  end
end
