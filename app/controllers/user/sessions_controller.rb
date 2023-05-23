# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :authenticate_user!, except: [:top, :about,:public_items]
  before_action :user_state, only: [:create]
  #before_action :customer_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
  def after_sign_in_path_for(resource)
      user_post_items_path
  end

  def after_sign_out_path_for(resource)
      root_path
  end

  protected

  def user_state
    @user = User.find_by(email: params[:customer][:email])
    return if !@user
    if @user.valid_password?(params[:customer][:password]) && @user.is_deleted == true
      redirect_to new_user_registration_path
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
