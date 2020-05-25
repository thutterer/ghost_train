class ProgressiveController < ActionController::Base
  protect_from_forgery except: :service_worker

  def manifest; end

  def offline; end

  def service_worker
    respond_to do |format|
      format.js
    end
  end

  def start; end
end
