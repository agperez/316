require 'rails_helper'
describe Highlight do
  %i(title created_at video audio sermon_link).each do |field|
    it "requires a #{field}" do
      highlight = build :highlight, field => nil
      expect( highlight.valid? ).to be false
    end
  end
end
