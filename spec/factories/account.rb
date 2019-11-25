# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    first_name { 'Homer' }
    last_name  { 'Simpson' }

    sequence :email do |n|
      "wook-#{n}@gmail.com"
    end

    password { 'abc123' }
    referrer { 'referrer of the year' }
    phone_number { '555-121-1222' }
    address_1 { '123 Fake Street' }
    city { 'Springfield' }
    state { 'MO' }
    postal_code { '99229' }
    profession { 'nuclear technician' }
  end
end
