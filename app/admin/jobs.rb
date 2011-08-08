ActiveAdmin.register Job do
  form do |f|
    f.inputs "Job" do
      f.input :title, :as => :string
      f.input :description
      f.input :active
    end

    f.buttons
  end
end
