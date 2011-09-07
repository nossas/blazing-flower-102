# coding: utf-8
ActiveAdmin.register MeuRioTeamWidget do
  menu :parent => "Home", :label => "O que estamos aprontando…"
  filter :html_content

  index do
    column "HTML Content" do |w|
      raw w.html_content
    end
    column "Options" do |w|
      span link_to 'Show', admin_meu_rio_team_widget_path(w)
      span link_to 'Edit', edit_admin_meu_rio_team_widget_path(w)
    end
  end

  form :partial => "form"
  
end
