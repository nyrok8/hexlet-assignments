# frozen_string_literal: true

require 'csv'
require 'date'

namespace :hexlet do
  desc 'TODO'
  task import_users: :environment do |_, args|
    file_path = args.extras.first

    CSV.foreach(file_path, headers: true) do |row|
      user_data = row.to_hash.symbolize_keys
      user_data[:birthday] = Date.strptime(user_data[:birthday], '%m/%d/%Y')
      User.create!(user_data)
    end
  end
end
