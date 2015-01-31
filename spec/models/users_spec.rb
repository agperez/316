require 'rails_helper'
describe User do
  %i(first_name last_name email).each do |field|
    it "requires a #{field}" do
      user = build :user, field => nil
      expect( user.valid? ).to be false
    end
  end
end
