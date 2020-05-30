class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!, except: :welcome

  protect_from_forgery with: :exception

  rescue_from 'Pundit::NotAuthorizedError' do |exception|
    render 'not_authorized', status: :unauthorized
  end

  def account
    authorize :application, :account?
  end
end
