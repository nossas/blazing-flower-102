ActiveAdmin.register ImageWidget do
  menu :parent => "Widgets"

  filter :link

  index do
    column "Image" do |w|
      image_tag w.image.url(:thumb)
    end
    column "Options" do |w|
      span link_to 'Show', admin_image_widget_path(w)
      span link_to 'Edit', edit_admin_image_widget_path(w)
    end
  end

  form do |f|
    f.inputs "Image Widget" do
      f.input :image
    end

    f.buttons
  end
end
