class ApplicationController < ActionController::Base
 
 
 before_action :configure_permitted_parameters, if: :devise_controller?
 
 helper_method :current_cart
 
 def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
 end
 
 protected
 
 def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:account_update, keys: [:shopname, :description, :address, :phonenumber, :shop_image, :name])
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
 end
 
 def after_sign_out_path_for(resource)
    homes_path # ログアウト後に遷移するpathを設定
 end
end