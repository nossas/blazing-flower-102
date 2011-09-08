# coding: utf-8
ActiveAdmin.register PersonalStory do
  menu :priority => 6, :label => 'Direto da Gema'

  filter :issue
  filter :title
  filter :description

  index do
    column 'Na Atividade' do |i|
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
    column :updated_at do |m|
      l m.updated_at, :format => :short
    end
    column "Options" do |e| 
      span link_to 'Show', admin_personal_story_path(e)
      span link_to 'Edit', edit_admin_personal_story_path(e)
    end
  end

  form :partial => "form"
  
  show do |s|
    div({:class => 'panel' }) do
      h3 'Na Atividade'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table meu_rio_is_widget' }) do
          table do
            tr do
              th { 'Issue' }
              td { link_to s.issue.name, issue_personal_stories_path(s.issue) }
            end
            tr do
              th { 'Title' }
              td { s.title }
            end
            tr do
              th { 'Description' }
              td { s.description }
            end
            tr do
              th { 'Excerpt' }
              td { s.excerpt }
            end
            tr do
              th { 'Video' }
              td { raw(s.video_embed_code) }
            end
            tr do
              th { 'Video URL' }
              td { s.video_url }
            end
            tr do
              th { 'Thumbnail' }
              td { image_tag(s.thumbnail) }
            end
            tr do
              th { 'Connected Action' }
              td { s.connected_action.capitalize }
            end
            tr do
              th { 'Created at' }
              td { l s.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l s.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end
end



