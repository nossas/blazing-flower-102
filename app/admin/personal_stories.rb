ActiveAdmin.register PersonalStory do
  menu :priority => 6

  filter :issue
  filter :title
  filter :description

  index do
    column 'Issue' do |i|
      span i.issue.name
    end
    # 9/1 Ren: Commenting out for now, because I feel it'll likely come back.
    #column 'Connected Action' do |p|
    #  if p.issue
    #    if p.connected_action != "DEBATE" && !p.issue.debates.empty?
    #      link_to "Debate: #{p.issue.debates.first.title}", issue_debate_path(p.issue.id, p.issue.debates.first.id)
    #    elsif p.connected_action != "PETITION" && !p.issue.petitions.empty?
    #      link_to "Petition: #{p.issue.petitions.first.title}", issue_custom_petition_path(p.issue.id, p.issue.petitions.first.custom_path)
    #    else
    #      "None"
    #    end
    #  end
    #end
    column 'Title' do |s|
      link_to s.title, issue_personal_stories_path(s.issue)
    end
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    column "Options" do |e| 
      span link_to 'Show', admin_personal_story_path(e)
      span link_to 'Edit', edit_admin_personal_story_path(e)
    end
  end

  form :partial => "form"
end



