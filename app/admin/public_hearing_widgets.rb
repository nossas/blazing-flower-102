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
  
  show do |w|
    div({ :class => 'panel' }) do
      h3 'Public Hearing Widget Details'
      div({ :class => 'panel_contents' }) do
        div({ :class => 'attributes_table meu_rio_is_widget' }) do
          table do
            tr do
              th { 'HTML Content' }
              td { raw w.html_content }
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
