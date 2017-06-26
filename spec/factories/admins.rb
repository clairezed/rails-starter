# frozen_string_literal: true

FactoryGirl.define do
  factory :admin do
    email 'clairezuliani@gmail.com'
    password 'password'
    password_confirmation 'password'
  end
end
