require 'spec_helper'

describe Configuration do
  describe "validations and associations" do
    it{ should validate_presence_of :name }
    it{ should validate_uniqueness_of :name }
  end
end
