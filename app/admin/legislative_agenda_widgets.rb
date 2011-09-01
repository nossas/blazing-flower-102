ActiveAdmin.register LegislativeAgendaWidget do
  menu :parent => "Widgets", :label => "Legislative Agenda"
  filter :html_content

  index do
    column "HTML Content" do |w|
      raw w.html_content
    end
    column "Options" do |w|
      span link_to 'Show', admin_legislative_agenda_widget_path(w)
      span link_to 'Edit', edit_admin_legislative_agenda_widget_path(w)
    end
  end

  form :partial => "form"
end
