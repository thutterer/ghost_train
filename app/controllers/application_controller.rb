class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!, except: :welcome
  around_action :switch_time_zone, if: :current_user

  protect_from_forgery with: :exception

  rescue_from 'Pundit::NotAuthorizedError' do |exception|
    render 'not_authorized', status: :unauthorized
  end

  private

  def switch_time_zone(&block)
    Time.use_zone(current_user&.time_zone || "UTC", &block)
  end
end
