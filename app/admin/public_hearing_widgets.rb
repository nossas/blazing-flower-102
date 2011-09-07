# coding: utf-8
ActiveAdmin.register PublicHearingWidget do
  menu :parent => "Home", :label => "Audiências Pública"
  filter :html_content

  index do
    column "HTML Content" do |w|
      raw w.html_content
    end
    column "Options" do |w|
      span link_to 'Show', admin_public_hearing_widget_path(w)
      span link_to 'Edit', edit_admin_public_hearing_widget_path(w)
    end
  end

  form :partial => "form"
end
