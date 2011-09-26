# coding: utf-8
ActiveAdmin.register Debate do
  menu :priority => 4

  filter :issue, :label => 'Campanha'
  filter :author_1, :label => 'Autor 1'
  filter :author_2, :label => 'Autor 2'

  index do
    column 'Campanha' do |d|
      span d.issue.name
    end
    column 'Questão' do |d|
      link_to d.question, issue_debate_path(d.issue, d)
    end
    column "Comentários" do |d|
      span "#{d.comments.count}"
    end
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    default_actions
  end

  form :partial => "form"

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
            tr do
              th { 'Created at' }
              td { l debate.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l debate.updated_at, :format => :short }
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
              td { raw debate.quote_side_1 }
            end
            tr do
              th { 'Text' }
              td { raw debate.text_side_1 }
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
              td { raw debate.text_side_2 }
            end
          end
        end
      end
    end

  end

end
