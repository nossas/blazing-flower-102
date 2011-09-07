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
end
