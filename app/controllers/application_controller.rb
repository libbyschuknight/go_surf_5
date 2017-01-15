class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_filter :authorize_admin, only: :create

  private

  def authorize_admin
    redirect_to root_path, alert: "Admins only!" unless current_user.try(:admin?)
  end
end
