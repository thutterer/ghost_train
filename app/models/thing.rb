class Thing < ApplicationRecord
  belongs_to :user, optional: true
end
