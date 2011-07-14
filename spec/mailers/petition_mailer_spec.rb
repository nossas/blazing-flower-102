require "spec_helper"

describe PetitionMailer do
  describe "#petition_signature_confirmation" do
    let(:petition_signature){ Factory(:petition_signature) }
    let(:message){ petition_signature.petition.autofire_email }
    subject{ PetitionMailer.petition_signature_confirmation(petition_signature) }

    its(:subject){ should == message.subject }
    its(:from){ should == [message.from.match(/<(.*)>/)[1]] }
    its(:to){ should == [petition_signature.member.email] }

    it "renders the body" do
      subject.body.encoded.should match(message.message)
    end
  end
end
