ActiveAdmin.register AutofireEmail do
  menu :parent => "Petitions"

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
    column :created_at
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
end
