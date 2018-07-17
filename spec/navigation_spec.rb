require 'rails_helper'

RSpec.describe 'Nav bar as visitor' do
  it 'should have a registration link' do
    reg = "Register"
    log = "Log In"
    stamp = "Stamps"
    reg2 = "Item Registration"
    
    visit '/'

    within("#nav") do
      expect(page).to have_content(reg)
      expect(page).to have_content(log)
      expect(page).to have_content(stamp)
      expect(page).to have_content(reg2)
    end
  end
end
