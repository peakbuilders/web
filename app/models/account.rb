# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord
  validates :email, uniqueness: true, null: false

  attr_accessor :payment_method_nonce
end
