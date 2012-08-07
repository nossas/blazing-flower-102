# coding: utf-8
ActiveAdmin.register AutofireEmail do
  menu false

  filter :petition
  filter :from
  filter :subject

  index do
    column 'Petition' do |e|
      if e.petition
        link_to e.petition.title, admin_petition_path(e.petition)
      else
        'None'
      end
    end
    column :from
    column :subject
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    column "Options" do |e| 
      span link_to 'Show', admin_autofire_email_path(e)
      span link_to 'Edit', edit_admin_autofire_email_path(e)
    end
  end

  form do |f|
    f.inputs "Message Details" do
      f.input :petition
      f.input :from, :as => :string
      f.input :subject, :as => :string
      f.input :message
    end
    f.buttons
  end
  
  show do |e|
    div({:class => 'panel' }) do
      h3 'Autofire Email Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table petition' }) do
          table do
            tr do
              th { 'Petition' }
              td { e.petition.title }
            end
            tr do
              th { 'From' }
              td { e.from }
            end
            tr do
              th { 'Subject' }
              td { e.subject }
            end
            tr do
              th { 'Message' }
              td { e.message.html_safe }
            end
            tr do
              th { 'Created at' }
              td { l e.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l e.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end
end


