namespace :meu_rio do

  desc "Create a complete petition"
  task :create_petition => :environment do
    if Petition.find_by_custom_path("petition-test").nil?
      petition = Factory.create(:complete_petition, :counter_goal => 100, :custom_path => "petition-test")
      petition.publish
      10.times do |i|
        Factory.create(:petition_signature_with_comment, :petition => petition)
      end
    end
  end

end
