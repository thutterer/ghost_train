class Users::SessionsController < Devise::SessionsController
  # To use system time when validating the authenticity token
  skip_around_action :switch_time_zone
end
