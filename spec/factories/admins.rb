# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    email 'clairezuliani@gmail.com'
    password 'password'
    password_confirmation 'password'
  end
end
