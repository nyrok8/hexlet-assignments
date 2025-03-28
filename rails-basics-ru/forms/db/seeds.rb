# frozen_string_literal: true

5.times do
  Post.create(
    title: Faker::TvShows::DumbAndDumber.character,
    body: Faker::TvShows::DumbAndDumber.quote,
    summary: Faker::TvShows::DumbAndDumber.actor,
    published: Faker::Boolean.boolean
  )
end
