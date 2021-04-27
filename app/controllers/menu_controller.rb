class MenuController < ApplicationController
  before_action :set_cats
  def index
    @page = 'menu'
    @product = Product.all
  end
  def search
    query = params[:search]
    
    results = Product.where('name LIKE ?', "%#{query}%")
    if params[:filter] == 'Select Filter'
      @products = results
    else
      # 'Dairy Free'   -> 'dairy_free'   ->    :dairy_free
      symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym

      @products = results.where(symbol => true)
    end
  end

  private
  def set_cats
    @cats = Category.all.where(display:true)
  end
end
