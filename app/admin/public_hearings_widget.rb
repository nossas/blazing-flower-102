ActiveAdmin.register PublicHearingsWidget do
  menu :parent => "Widgets"
  filter :html_content

  index do
    column :html_content do |w|
      raw(w.html_content)
    end
    column "Options" do |w|
      span link_to 'Show', admin_public_hearings_widget_path(w)
      span link_to 'Edit', edit_admin_public_hearings_widget_path(w)
    end
  end

  form :partial => "form"
end
