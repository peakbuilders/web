# frozen_string_literal: true

require 'rails_helper'

describe 'payments' do
  include_context 'mock_data'

  let(:unpaid_account) { create(:account) }

  before do
    sign_in(unpaid_account)

    PaymentsController.class_eval { @charge_amount = 2222 }
  end

  describe 'with a failing payment' do
    it 'allows a user to pay', js: true do
      pending

      visit new_payment_path(unpaid_account)
      find('div[aria-label="Paying with Card"]').click

      within_frame('braintree-hosted-field-number') do
        fill_in 'credit-card-number', with: '4000111111111115'
      end

      within_frame('braintree-hosted-field-expirationDate') do
        fill_in 'expiration', with: '02/22'
      end

      click_button 'Join now'
      expect(page).to have_css('.notice', text: 'Please fix errors and try again.')
    end
  end
end
