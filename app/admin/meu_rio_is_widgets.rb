# coding: utf-8
ActiveAdmin.register MeuRioIsWidget do
  menu :parent => "Home", :label => "Membros"
  filter :html_content

  index do
    column "HTML Content" do |w|
      raw w.html_content
    end
    column "Options" do |w|
      span link_to 'Show', admin_meu_rio_is_widget_path(w)
      span link_to 'Edit', edit_admin_meu_rio_is_widget_path(w)
    end
  end

  show do |w|
    div({:class => 'panel' }) do
      h3 'O Meu Rio é...'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table meu_rio_is_widget' }) do
          table do
            tr do
              th { 'Atualizado em' }
              td { l w.updated_at }
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

  form :partial => "form"

end
