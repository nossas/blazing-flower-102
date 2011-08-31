ActiveAdmin.register PersonalStory do
  menu :priority => 6

  filter :issue
  filter :title
  filter :description

  index do
    column 'Issue' do |i|
      if i.issue
        link_to i.issue.name, admin_issue_path(i.issue)
      else
        'None'
      end
    end
    column :title
    column :video_url
    column "Options" do |e| 
      span link_to 'Show', admin_personal_story_path(e)
      span link_to 'Edit', edit_admin_personal_story_path(e)
    end
  end

  form do |f|
    f.inputs "Personal Story" do
      f.input :issue
      f.input :title, :as => :string
      f.input :description
      f.input :excerpt
      f.input :connected_action, :label => 'Button links to:', :as => :select, :collection =>  [['None', 'NONE'], ['Petition', 'PETITION'], ['Debate', 'DEBATE']]
      f.input :video_url
    end
    f.buttons
  end
end
