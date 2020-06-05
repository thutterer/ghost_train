require "administrate/base_dashboard"

class Ahoy::EventDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    visit: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    properties: Field::String.with_options(searchable: false),
    time: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
  visit
  user
  id
  name
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
  visit
  user
  id
  name
  properties
  time
  ].freeze

  FORM_ATTRIBUTES = %i[
  visit
  user
  name
  properties
  time
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
