require "administrate/base_dashboard"

class Ahoy::VisitDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    started_at: Field::DateTime.with_options(format: :short),
    events: Field::HasMany.with_options(class_name: "Ahoy::Event"),
    user: Field::BelongsTo,
    id: Field::Number,
    visit_token: Field::String,
    visitor_token: Field::String,
    ip: Field::String,
    user_agent: Field::Text,
    referrer: Field::Text,
    referring_domain: Field::String,
    landing_page: Field::Text,
    browser: Field::String,
    os: Field::String,
    device_type: Field::String,
    country: Field::String,
    region: Field::String,
    city: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    utm_source: Field::String,
    utm_medium: Field::String,
    utm_term: Field::String,
    utm_content: Field::String,
    utm_campaign: Field::String,
    app_version: Field::String,
    os_version: Field::String,
    platform: Field::String,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
  started_at
  user
  os
  device_type
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
  started_at
  events
  user
  id
  visit_token
  visitor_token
  ip
  user_agent
  referrer
  referring_domain
  landing_page
  browser
  os
  device_type
  country
  region
  city
  latitude
  longitude
  utm_source
  utm_medium
  utm_term
  utm_content
  utm_campaign
  app_version
  os_version
  platform
  ].freeze

  FORM_ATTRIBUTES = %i[].freeze

  COLLECTION_FILTERS = {}.freeze
end
