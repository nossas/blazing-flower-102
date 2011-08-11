ActiveAdmin.register FeaturedContentWidget do
  menu :parent => "Widgets"

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

  form do |f|
    f.inputs "Featured Content Widget" do
      f.input :title, :as => :string
      f.input :link,  :as => :string
      f.input :image
    end

    f.buttons
  end
end
