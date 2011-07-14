ActiveAdmin.register Issue do
  index do
    column :name
    column "Options" do |o|
      span link_to "Show", admin_issue_path(o)
      span link_to "Edit", edit_admin_issue_path(o)
    end
  end

  form do |f|
    f.inputs "Issue Information" do
      f.input :name, :as => :string
      f.input :excerpt
      f.input :description
      f.input :image, :as => :file
    end
    f.buttons
  end
end
