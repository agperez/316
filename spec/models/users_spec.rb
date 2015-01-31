require 'rails_helper'
describe User do
  %i(first_name last_name email password password_confirmation).each do |field|
    it "requires a #{field}" do
      user = build :user, field => nil
      expect( user.valid? ).to be false
    end
  end

  it "formats name well" do
    user = build :user
    expect(user.fullname).to eq user.first_name + " " + user.last_name
  end
end
