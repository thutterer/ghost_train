module Admin
  class Ahoy::VisitsController < Admin::ApplicationController
    def valid_action?(name, resource = resource_class)
      %w[index show].include?(name.to_s) && super
    end
  end
end
