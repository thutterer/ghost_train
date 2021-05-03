class Thing < ApplicationRecord
  include Discard::Model

  belongs_to :user, optional: true

  before_create do
    data['type'] = model_name.singular_route_key
  end
end
