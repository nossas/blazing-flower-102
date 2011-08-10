ActiveAdmin.register FeaturedContentWidget do
  menu :parent => "Widgets"

  filter :link

  index do
    column :link
    column :image_url
    column "Options" do |w|
      span link_to 'Show', admin_featured_content_widget_path(w)
      span link_to 'Edit', edit_admin_featured_content_widget_path(w)
    end
  end

  form do |f|
    f.inputs "Featured Content Widget" do
      f.input :link, :as => :string
      f.input :image
    end

    f.buttons
  end
end
