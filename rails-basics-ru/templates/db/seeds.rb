# frozen_string_literal: true

5.times do
  Task.create(
    name: Faker::JapaneseMedia::OnePiece.akuma_no_mi,
    description: Faker::JapaneseMedia::OnePiece.quote,
    status: Faker::JapaneseMedia::OnePiece.sea,
    creator: Faker::JapaneseMedia::OnePiece.character,
    performer: Faker::JapaneseMedia::OnePiece.character,
    completed: Faker::Boolean.boolean
  )
end
