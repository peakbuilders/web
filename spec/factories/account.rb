# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    first_name { 'John' }
    last_name  { 'Doe' }
    email { 'e@e.com' }
    password { 'abc123' }
    referrer { 'abc123' }
    phone_number { 'abc123' }
    address_1 { 'abc123' }
    city { 'abc123' }
    state { 'abc123' }
    postal_code { 'abc123' }
    profession { 'abc123' }
  end
end
