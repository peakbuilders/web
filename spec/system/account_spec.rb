# frozen_string_literal: true

require 'rails_helper'

describe 'accounts' do
  include_context 'mock_data'

  before do
    @mock_gateway = double('gateway')
    generator = OpenStruct.new(generate: 'your_client_token')
    expect(@mock_gateway).to receive('client_token').and_return(generator).exactly(2).times

    expect(Braintree::Gateway).to receive(:new).and_return(@mock_gateway).exactly(3).times

    expect(@mock_gateway).to receive_message_chain('transaction.sale') {
      Braintree::SuccessfulResult.new(transaction: mock_transaction)
    }
  end

  it 'allow a user to join' do
    visit root_path
    click_link 'Join'
    click_button 'Join now'
    expect(page).to have_css('.alert', text: '{"email"=>["can\'t be blank"]}')
  end
end
