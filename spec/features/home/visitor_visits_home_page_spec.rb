require 'rails_helper'

RSpec.describe 'Visitor visits home#index' do
  it 'they should see app name, description and info sections' do
    wc = "World Citizen"
    tagline = "A way to give back to the world through the purchase you already make"
    info1 = "How you're helping:"
    info2 = "How to play:"
    visit '/'

    expect(page).to have_content(wc)
    expect(page).to have_content(tagline)
    expect(page).to have_content(messgage)
    expect(page).to have_content(info1)
    expect(page).to have_content(info2)
  end
end
