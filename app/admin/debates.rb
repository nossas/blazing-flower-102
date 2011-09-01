ActiveAdmin.register Debate do
  menu :priority => 4

  filter :issue
  filter :author_1
  filter :author_2

  index do
    column :issue
    column :question
    column :author_email_side_1
    column :author_email_side_2
    column "Comments" do |d|
      span "#{d.comments.count}"
    end
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    column "Options" do |d|
      span link_to "Show", admin_debate_path(d)
      span link_to "Edit", edit_admin_debate_path(d)
    end
  end

  form do |f|
    f.inputs "Debate Information" do
      f.input :issue
      f.input :title, :as => :string
      f.input :question, :as => :string
      f.input :comment_prompt, :as => :string
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

  show do
    div({:class => 'panel' }) do
      h3 'Debate Information'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table debate' }) do
          table do
            tr do
              th { 'Issue' }
              td { debate.issue.name }
            end
            tr do
              th { 'Title' }
              td { debate.title }
            end
            tr do
              th { 'Question' }
              td { debate.question }
            end
            tr do
              th { 'Comment Prompt' }
              td { debate.comment_prompt }
            end
          end
        end
      end
    end

    div({:class => 'panel' }) do
      h3 'Side 1'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table debate' }) do
          table do
            tr do
              th { 'Author Email' }
              td { debate.author_email_side_1 }
            end
            tr do
              th { 'Author Title' }
              td { debate.author_title_side_1 }
            end
            tr do
              th { 'Author Organization' }
              td { debate.author_organization_side_1 }
            end
            tr do
              th { 'Quote' }
              td { debate.quote_side_1 }
            end
            tr do
              th { 'Text' }
              td { debate.text_side_1 }
            end
          end
        end
      end
    end

    div({:class => 'panel' }) do
      h3 'Side 2'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table debate' }) do
          table do
            tr do
              th { 'Author Email' }
              td { debate.author_email_side_2 }
            end
            tr do
              th { 'Author Title' }
              td { debate.author_title_side_2 }
            end
            tr do
              th { 'Author Organization' }
              td { debate.author_organization_side_2 }
            end
            tr do
              th { 'Quote' }
              td { debate.quote_side_2 }
            end
            tr do
              th { 'Text' }
              td { debate.text_side_2 }
            end
          end
        end
      end
    end

  end

end
