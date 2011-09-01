# coding: utf-8
ActiveAdmin.register MeuRioIsWidget do
  menu :parent => "Widgets", :label => "Meu Rio Is"
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

  show do
    div({:class => 'panel' }) do
      h3 'O Meu Rio é...'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table meu_rio_is_widget' }) do
          table do
            tr do
              th { 'Id' }
              td { meu_rio_is_widget.id.to_s }
            end
            tr do
              th { 'Atualizado em' }
              td { l meu_rio_is_widget.updated_at }
            end
          end
        end
      end
    end
  end

  form :partial => "form"

end
