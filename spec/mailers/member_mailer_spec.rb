require "spec_helper"

describe MemberMailer do
  describe "welcome" do
    let(:member) { mock_model(Member, :first_name => "Ren", :email => "ren@purpose.com") }
    let(:mail) { MemberMailer.welcome(member) }

    it "renders the headers" do
      mail.subject.should eq("Seja bem-vindo!")
      mail.to.should eq(["ren@purpose.com"])
      mail.from.should eq(["test@meurio.org.br"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Obrigado por fazer parte do Meu Rio.")
    end
  end

end
