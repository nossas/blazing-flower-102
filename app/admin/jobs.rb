ActiveAdmin.register Job do
  index do
    column :title
    column :active
    column "Options" do |e| 
      span link_to 'Show', admin_job_path(e)
      span link_to 'Edit', edit_admin_job_path(e)
    end
  end

  form do |f|
    f.inputs "Job" do
      f.input :title, :as => :string
      f.input :description
      f.input :active
    end

    f.buttons
  end
end
