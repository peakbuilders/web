# frozen_string_literal: true

require 'rails_helper'

describe 'accounts' do
  include_context 'mock_data'

  let(:mock_gateway) { double('gateway') }
  let(:client_token) { OpenStruct.new(generate: 'your_client_token') }
  let(:transaction) { double('transaction') }
  let(:successful_result) { Braintree::SuccessfulResult.new(transaction: mock_transaction) }

  describe 'without a browser' do
    before do
      allow(Braintree::Gateway).to receive(:new).and_return(mock_gateway)
      allow(mock_gateway).to receive('client_token').and_return(client_token)
      allow(mock_gateway).to receive('transaction').and_return(transaction)
      allow(transaction).to receive('sale').and_return(successful_result)
    end

    it 'allow a user to join' do
      visit root_path
      click_link 'Join'
      click_button 'Next'
      expect(page).to have_css('.alert', text: 'Please fix errors below and try again.')

      fill_in 'account_email', with: 'test@test.com'
      fill_in 'account_first_name', with: 'test@test.com'
      fill_in 'account_last_name', with: 'test@test.com'
      fill_in 'account_phone_number', with: 'test@test.com'
      fill_in 'account_address_1', with: 'test@test.com'
      fill_in 'account_city', with: 'test@test.com'
      fill_in 'account_state', with: 'test@test.com'
      fill_in 'account_postal_code', with: 'test@test.com'
      fill_in 'account_referrer', with: 'test@test.com'
      fill_in 'account_profession', with: 'test@test.com'
      click_button 'Next'
      click_button 'Join now'
      expect(page).to have_css('h1', text: 'Welcome to the Member Home Page')
    end
  end

  describe 'with the browser' do
    it 'allows a user to join', js: true do
      visit root_path
      click_link 'Join'

      fill_in 'account_email', with: 'test@test.com'
      fill_in 'account_first_name', with: 'test@test.com'
      fill_in 'account_last_name', with: 'test@test.com'
      fill_in 'account_phone_number', with: 'test@test.com'
      fill_in 'account_address_1', with: 'test@test.com'
      fill_in 'account_city', with: 'test@test.com'
      fill_in 'account_state', with: 'test@test.com'
      fill_in 'account_postal_code', with: 'test@test.com'
      fill_in 'account_referrer', with: 'test@test.com'
      fill_in 'account_profession', with: 'test@test.com'
      click_button 'Next'
      find('div[aria-label="Paying with Card"]').click

      within_frame('braintree-hosted-field-number') do
        fill_in 'credit-card-number', with: '378282246310005'
      end

      within_frame('braintree-hosted-field-expirationDate') do
        fill_in 'expiration', with: '02/22'
      end

      click_button 'Join now'
      expect(page).to have_css('h1', text: 'Welcome to the Member Home Page')
    end
  end
end
