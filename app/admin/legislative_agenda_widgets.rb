# coding: utf-8
ActiveAdmin.register LegislativeAgendaWidget do
  menu :parent => "Home", :label => "De Olho no Legislativo"
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
  
  show do |w|
    div({:class => 'panel'}) do
      h3 'Legislative Agenda Widget Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table issue'  }) do
          table do
            tr do
              th do 
                'HTML Content'
              end
              td do
                raw(w.html_content)
              end
            end
            tr do
              th { 'Created at' }
              td { l w.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l w.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end
end
