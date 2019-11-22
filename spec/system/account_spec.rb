# frozen_string_literal: true

require 'rails_helper'

describe 'accounts' do
  include_context 'mock_data'

  let(:mock_gateway) { double('gateway') }
  let(:client_token) { OpenStruct.new(generate: 'your_client_token') }
  let(:transaction) { double('transaction') }
  let(:failed_result) { Braintree::SuccessfulResult.new(transaction: mock_failed_transaction) }
  let(:successful_result) { Braintree::SuccessfulResult.new(transaction: mock_transaction) }

  before do
    expect(Braintree::Gateway).to receive(:new).and_return(mock_gateway).exactly(4).times
    expect(mock_gateway).to receive('client_token').and_return(client_token).exactly(2).times
    expect(mock_gateway).to receive('transaction').and_return(transaction).exactly(2).times
    expect(transaction).to receive('sale').and_return(failed_result, successful_result).exactly(2).times
  end

  it 'allow a user to join' do
    visit root_path
    click_link 'Join'
    click_button 'Join now'
    expect(page).to have_css('.alert', text: '{"email"=>["can\'t be blank"]}')

    fill_in 'account_email', with: 'test@test.com'
    click_button 'Join now'
    expect(page).to have_css('.heading', text: 'And we\'re glad glad glad that you\'ve arrived')
  end

  describe 'with the browser' do
    it 'allows a user to join', js: true do
      pending
      visit root_path
      click_link 'Join'
      click_button 'Join now'
      expect(page).to have_css('.alert', text: '{"email"=>["can\'t be blank"]}')

      fill_in 'account_email', with: 'test@test.com'
      click_button 'Join now'
      expect(page).to have_css('.heading', text: 'And we\'re glad glad glad that you\'ve arrived')
    end
  end
end
