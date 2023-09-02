# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Quotes', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'creates a new quote' do
    expect(true).to be false
  end
end
