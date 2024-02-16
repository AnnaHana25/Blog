class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  def sign_out_user
    sign_out(current_user)
    redirect_to root_path, notice: 'You have been signed out successfully.'
  end
end
