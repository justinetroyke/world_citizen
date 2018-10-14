require 'rails_helper'

describe "Login API" do
  xit "login user" do
    user = User.create(name: 'Alex Goldman', email: 'swipe@swipe.com', password: '123abc')

    post "/api/v1/login?user=#{user.name}&password=#{user.password}"

    expect(status).to eq(400)
  end
end
