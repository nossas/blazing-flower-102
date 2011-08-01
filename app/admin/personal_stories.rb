ActiveAdmin.register PersonalStory do
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
