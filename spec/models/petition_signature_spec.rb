# encoding: utf-8
require 'spec_helper'

describe PetitionSignature do
  describe ".after_create" do
    it "should call PetitionMailer.petition_signature_confirmation" do
      PetitionMailer.should_receive(:petition_signature_confirmation)
      Factory(:petition_signature, :petition => Factory(:complete_petition)) 
    end
  end
end
