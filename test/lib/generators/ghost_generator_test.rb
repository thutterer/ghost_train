require "test_helper"
require "generators/ghost/ghost_generator"

class GhostGeneratorTest < Rails::Generators::TestCase
  tests GhostGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
