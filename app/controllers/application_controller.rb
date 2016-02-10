require "cart_service"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 before_action :cart

  def cart
    session

    CartService.configure do |config|
      config.store = session
    end

    @items_in_cart = CartService.count
  end
end
