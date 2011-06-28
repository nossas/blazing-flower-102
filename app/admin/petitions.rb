ActiveAdmin.register Petition do
  filter :title
  filter :custom_path
  filter :headline

  index do
    column :title
    column :headline
    column :custom_path
    column 'Autofire Email' do |p|
      if p.autofire_email
        link_to p.autofire_email.subject, admin_autofire_email_path(p.autofire_email)
      else
        link_to "Create Email", new_admin_autofire_email_path
      end
    end
    column 'TAF' do |p|
      if p.taf
        link_to p.taf.thank_you_headline, admin_taf_path(p.taf)
      else
        link_to "Create TAF", new_admin_taf_path
      end
    end
    column "Options" do |e| 
      span link_to 'Show', admin_petition_path(e)
      span link_to 'Edit', edit_admin_petition_path(e)
    end
  end

  form do |f|
    f.inputs "Campaign Information" do
    end

    f.inputs "Petition Information" do
      f.input :title, :as => :string
      f.input :headline, :as => :string
      f.input :custom_path, :as => :string
      f.input :description
      f.input :call_to_action, :as => :string
    end

    f.inputs "Featured Information" do
      f.input :short_description
    end

    f.inputs "Petition Settings" do
      f.input :display_counter
      f.input :counter_threshold
      f.input :counter_goal
      f.input :display_comment_field
      f.input :comment_question, :as => :string
      f.input :surface_comments
    end

    f.buttons
  end
end
