# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
[9, 10, 11].each do |year|
    ["60m", "200m", "400m", "800m", "Javelin", "Shot putt", "High Jump", "Long Jump"].each do |activity|
        ["Boys", "Girls"].each do |gender|
            Event.find_or_create_by(activity: activity, year: year, gender: gender, sharman: 0, winston: 0, ennis: 0, turing: 0)
        end
    end
    Event.find_or_create_by(activity: "4x50 Relay", year: year, gender: "Mixed", sharman: 0, winston: 0, ennis: 0, turing: 0)
end