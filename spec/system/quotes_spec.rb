# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Quotes', type: :system do
  before do
    driven_by(:rack_test)
  end

  setup do
    @quote = FactoryBot.create(:quote)
  end

  it 'creates a new quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'
    click_on 'New quote'
    assert_selector 'h1', text: 'New quote'
    fill_in 'Name', with: 'ABC quote'
    click_on 'Create quote'
    assert_selector 'h1', text: 'Quotes'
    assert_text 'ABC quote'
  end

  it 'shows a quote' do
    visit quotes_path
    click_link @quote.name

    assert_selector 'h1', text: @quote.name
  end

  it 'updates a quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'Edit', match: :first
    assert_selector 'h1', text: 'Edit quote'

    fill_in 'Name', with: 'Updated quote'
    click_on 'Update quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Updated quote'
  end

  it 'destroys a quote' do
    visit quotes_path
    assert_text @quote.name

    click_on 'Delete', match: :first
    assert_no_text @quote.name
  end
end
