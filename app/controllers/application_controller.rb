class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Будь ласка, увійдіть в обліковий запис."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)||current_user.admin?
  end
# Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
