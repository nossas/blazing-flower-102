# coding: utf-8

namespace :meurio do
  desc "Create a complete issue"
  task :create_issue => :environment do
    if Issue.find_by_name("Demo issue").nil?
      issue = Factory.create(:issue, :name => "Demo issue")
      petition = Factory.create(:complete_petition, :counter_goal => 100, :custom_path => "demo-petition", :issue => issue)
      petition.publish
      debate = Factory.create(:debate, :issue => issue)

      10.times do |i|
        Factory.create(:petition_signature_with_comment, :petition => petition)
        Factory.create(:comment, :commentable => debate)
      end

    end
  end

  desc "Export statistics table"
  task :export => :environment do
    puts "\"Email\", \"Ação\", \"Objeto\", \"ID do Objeto\", \"ID do Tema\", \"Data da Ação\", \"Plataforma\""
    PeitionSignature.all.each {|ps| puts "\"#{ps.member.email}\", \"Assinou\", \"Petição\", \"#{ps.petition.id}\", , \"#{ps.created_at}\", \"MR\""}
  end
end
