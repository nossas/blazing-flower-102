ActiveAdmin.register Debate do
  index do
    column :issue
    column :question
    column :author_email_side_1
    column :author_email_side_2
    column "Options" do |d|
      span link_to "Show", admin_debate_path(d)
      span link_to "Edit", admin_debate_path(d)
    end
  end

  form do |f|
    f.inputs "Debate Information" do
      f.input :issue
      f.input :title, :as => :string
      f.input :question, :as => :string
    end
    f.inputs "Side 1" do
      f.input :author_email_side_1, :label => "Author Email", :as => :string
      f.input :author_title_side_1, :label => "Author Title", :as => :string
      f.input :author_organization_side_1, :label => "Author Organization", :as => :string
      f.input :quote_side_1, :label => "Highlighted Quote", :as => :string
      f.input :text_side_1, :label => "Text"
    end
    f.inputs "Side 2" do
      f.input :author_email_side_2, :label => "Author Email", :as => :string
      f.input :author_title_side_2, :label => "Author Title", :as => :string
      f.input :author_organization_side_2, :label => "Author Organization", :as => :string
      f.input :quote_side_2, :label => "Hightlighted Quote", :as => :string
      f.input :text_side_2, :label => "Text"
    end
    f.buttons
  end
  
end
