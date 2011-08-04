ActiveAdmin.register PersonalStory do
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
  end

  form do |f|
    f.inputs "Personal Story" do
      f.input :issue
      f.input :title, :as => :string
      f.input :description
      f.input :connected_action, :label => 'Button links to:', :as => :select, :collection =>  [['Petition', 'PETITION'], ['Debate', 'DEBATE']]
      f.input :video_url
    end
    f.buttons
  end
end
