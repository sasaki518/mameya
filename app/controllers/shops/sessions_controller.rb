# frozen_string_literal: true

class Shops::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  #def create
  #super
  #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def after_sign_out_path_for(resource)
    homes_shops_path
  end
  
  def after_sign_in_path_for(resource)
    shops_items_path
  end
  
end
