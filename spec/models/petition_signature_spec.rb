# encoding: utf-8
require 'spec_helper'

describe PetitionSignature do
  let(:petition_signature){ Factory.build(:petition_signature) }
  describe "#petition" do
    it { should belong_to :petition }
  end

  describe "#member" do
    it { should belong_to :member }
  end

  describe '#accept_comment' do
    subject{ petition_signature.accept_comment }
    its(:comment_accepted){ should be_true }
  end

  describe '#reject_comment' do
    subject{ petition_signature.reject_comment }
    its(:comment_accepted){ should be_false }
  end

  describe '#valid?' do
    subject{ petition_signature.valid? }
    context "when the petition is in draft state" do
      let(:petition_signature) do
        petition = Factory.build(:complete_petition)
        PetitionSignature.new :petition => petition
      end
      it{ should be_false }
    end

    context "when the petition is published" do
      it{ should be_true }
    end
  end

end