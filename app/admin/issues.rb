ActiveAdmin.register Issue do
  menu :priority => 2

  filter :name
  filter :description
  filter :excerpt

  index do
    column :name
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
            end
          end
        end
      end
    end
  end
end
