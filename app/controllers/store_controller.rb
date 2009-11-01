class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
    @cart = find_cart

    #count index
    if session[:count_index]
      session[:count_index] += 1
    else
      session[:count_index] = 0
    end
  end

  def add_to_cart
   #count index
   if session[:count_index] > 0
     session[:count_index] = nil
   end

   product = Product.find(params[:id])
   @cart = find_cart
   @cart.add_product(product)
   respond_to do |format|
     format.js
   end

  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")

  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index('shopping cart is empty now!')
  end

private
  def find_cart
    unless session[:cart]
      session[:cart] = Cart.new
    end
    session[:cart]
  end  

  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end

end
