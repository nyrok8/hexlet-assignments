# frozen_string_literal: true

require 'faker'

5.times do
  Task.create(
    name: Faker::Artist.name,
    description: Faker::Movies::HarryPotter.quote,
    status: Faker::Movies::HarryPotter.spell,
    creator: Faker::Movies::HarryPotter.character,
    performer: Faker::Movies::HarryPotter.character,
    completed: Faker::Boolean.boolean
  )
end
