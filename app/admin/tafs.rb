ActiveAdmin.register Taf do
  menu false

  filter :petition

  index do
    column 'Petition' do |t|
      if t.petition
        link_to t.petition.title, admin_petition_path(t.petition)
      else
        'None'
      end
    end
    column :thank_you_headline
    column "Options" do |e| 
      span link_to 'Show', admin_taf_path(e)
      span link_to 'Edit', edit_admin_taf_path(e)
    end
    column :created_at do |m|
      l m.created_at, :format => :short
    end
  end

  form do |f|
    f.inputs "TAF Information" do
      f.input :petition
      f.input :thank_you_headline, :as => :string
      f.input :thank_you_text
    end
    f.inputs "Orkut" do
      f.input :display_orkut
      f.input :orkut_title, :as => :string
      f.input :orkut_link, :as => :string
      f.input :orkut_message
    end
    f.inputs "Facebook" do
      f.input :display_facebook
      f.input :facebook_image, :as => :file
      f.input :facebook_title, :as => :string
      f.input :facebook_link, :as => :string
      f.input :facebook_message
    end
    f.inputs "Twitter" do
      f.input :display_twitter
      f.input :tweet, :as => :string
      f.input :twitter_url, :as => :string
    end
    f.inputs "Email" do
      f.input :display_email
      f.input :email_subject, :as => :string
      f.input :email_message
    end
    f.inputs "Copy URL" do
      f.input :display_copy_url
    end
    f.buttons
  end

end
