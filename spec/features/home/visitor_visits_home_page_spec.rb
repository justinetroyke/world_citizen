require 'rails_helper'

RSpec.describe 'Visitor visits home#index' do
  it 'should have a registration link' do
    reg = "Register!"
    log = "Log In"
    stamp = "Stamps"

    visit root_path

    expect(page).to have_content(reg)
    expect(page).to have_content(log)
    expect(page).to have_content(stamp)
  end

  it 'should show app name, description and info sections above the fold' do
    wc = "World Citizen"
    tagline = "A way to give back to the world through the purchases you already make"
    info1 = "How you're helping"
    info2 = "How to play"

    visit root_path

    expect(page).to have_content(wc)
    expect(page).to have_content(tagline)
    expect(page).to have_content(info1)
    expect(page).to have_content(info2)
  end
end
