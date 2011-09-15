# coding: utf-8
ActiveAdmin.register Issue do
  menu :priority => 2, :label => 'Campanhas'

  filter :name
  filter :description
  filter :excerpt

  index do
    column :name do |i|
     span link_to i.name, issue_path(i)
    end
    column 'Petições' do |i|
      span i.petitions.count
    end
    column 'Debates' do |i|
      span i.debates.count
    end
    column 'Videos' do |i|
      span i.personal_stories.count
    end
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    column "Options" do |o|
      span link_to "Show", admin_issue_path(o)
      span link_to "Edit", edit_admin_issue_path(o)
    end
  end

  form :partial => "form"

  show do
    div({:class => 'panel'}) do
      h3 'Issue Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table issue'  }) do
          table do
            tr do
              th do
                'Name'
              end
              td do 
                issue.name
              end
              tr do 
                th do
                  'Excerpt'
                end
                td do
                  issue.excerpt
                end
              end
              tr do
                th do
                  'Description'
                end
                td do
                  issue.description
                end
              end
              tr do
                th do 
                  'Image'
                end
                td do
                  img({:src => issue.image.url})
                end
              end
              tr do
                th do 
                  'Thumbnail'
                end
                td do
                  img({:src => issue.thumbnail.url})
                end
              end
              tr do
                th { 'Created at' }
                td { l issue.created_at, :format => :short }
              end
              tr do
                th { 'Updated at' }
                td { l issue.updated_at, :format => :short }
              end
            end
          end
        end
      end
    end
  end
end
