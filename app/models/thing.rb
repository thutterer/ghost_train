class Thing < ApplicationRecord
  belongs_to :user, optional: true
  store_accessor :data, :type

  before_save do
    type = model_name.singular_route_key
  end
end
