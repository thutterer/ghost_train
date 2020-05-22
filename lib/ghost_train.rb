class GhostTrain
  def self.call
    puts "All aboard!"

    require File.expand_path('../config/application', __dir__)
  end
end
