ActiveAdmin.register Debate do
  index do
    column :issue
    column :question
    column :author_side_1_email
    column :author_side_2_email
    column "Options" do |d|
      span link_to "Show", admin_debate_path(d)
      span link_to "Edit", admin_debate_path(d)
    end
  end

  form do |f|
    f.inputs "Debate Information" do
      f.input :issue
      f.input :question, :as => :string
    end
    f.inputs "Side 1" do
      f.input :author_email_side_1, :label => "Author Email", :as => :string
      f.input :quote_side_1, :label => "Highlighted Quote"
      f.input :text_side_1, :label => "Text"
    end
    f.inputs "Side 2" do
      f.input :author_email_side_2, :label => "Author Email", :as => :string
      f.input :quote_side_2, :label => "Hightlighted Quote"
      f.input :text_side_2, :label => "Text"
    end
    f.buttons
  end
  
end
