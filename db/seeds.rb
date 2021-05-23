# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Blazer::Query.find_or_create_by(name: "Device types") do |query|
  query.data_source = "main"
  query.statement = <<-SQL
    SELECT device_type,
    count(*)
    FROM ahoy_visits
    WHERE started_at >= {start_time}
    AND started_at <= {end_time}
    GROUP BY device_type
    ORDER BY count DESC
  SQL
end

Blazer::Query.find_or_create_by(name: "Popular browsers") do |query|
  query.data_source = "main"
  query.statement = <<-SQL
    WITH browsers AS
    (SELECT browser,
    count(*)
    FROM ahoy_visits
    WHERE started_at > {start_time}
    AND started_at < {end_time}
    GROUP BY browser
    ORDER BY count desc),
    tops AS
    (SELECT *
    FROM browsers
    LIMIT 10),
    others AS
    (SELECT *
    FROM browsers
    OFFSET 10)
    SELECT *
    FROM tops
    UNION
    SELECT 'Other',
    SUM(count)
    FROM others
  SQL
end

Blazer::Query.find_or_create_by(name: "Visitors per country") do |query|
  query.data_source = "main"
  query.statement = <<-SQL
    WITH countries AS
    (SELECT country,
    count(*)
    FROM ahoy_visits
    WHERE started_at > {start_time}
    AND started_at < {end_time}
    GROUP BY country
    ORDER BY count)
    SELECT country,
    count::text as count
    FROM countries
  SQL
end
