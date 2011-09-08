# coding: utf-8
ActiveAdmin.register FeaturedContentWidget do
  menu :parent => "Home", :label => "Conteúdo em Destaque"

  filter :link

  index do
    column :title
    column :link
    column "Image" do |w|
      image_tag w.image.url
    end
    column "Options" do |w|
      span link_to 'Show', admin_featured_content_widget_path(w)
      span link_to 'Edit', edit_admin_featured_content_widget_path(w)
    end
  end

  form :partial => "form"
  
  show do |w|
    div({:class => 'panel' }) do
      h3 'Comment Information'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table' }) do
          table do
            tr do
              th { 'Title' }
              td { w.title }
            end
            tr do
              th { 'Link' }
              td { w.link }
            end
            tr do
              th { 'Image' }
              td { image_tag w.image.url }
            end
            tr do
              th { 'Created at' }
              td { l w.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l w.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end
end
