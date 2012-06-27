# coding: utf-8
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
      f.input :alternate_facebook_image, :as => :file
      f.input :alternate_facebook_image_2, :as => :file
      f.input :alternate_facebook_image_3, :as => :file
      f.input :alternate_facebook_image_4, :as => :file
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
  
  show do |t|
    div({:class => 'panel' }) do
      h3 'TAF Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table' }) do
          table do
            tr do
              th { 'Petition' }
              td { t.petition.title }
            end
            tr do
              th { 'Thank You Headline' }
              td { t.thank_you_headline }
            end
            tr do
              th { 'Thank You Text' }
              td { t.thank_you_text }
            end
            tr do
              th { 'Display Copy URL' }
              td { t.display_copy_url.to_s }
            end
            tr do
              th { 'Created at' }
              td { l t.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l t.updated_at, :format => :short }
            end
          end
        end
      end
    end

    div({:class => 'panel' }) do
      h3 'Orkut Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table meu_rio_is_widget' }) do
          table do
            tr do
              th { 'Display Orkut' }
              td { t.display_orkut.to_s }
            end
            tr do
              th { 'Orkut Title' }
              td { t.orkut_title }
            end
            tr do
              th { 'Orkut Link' }
              td { t.orkut_link }
            end
            tr do
              th { 'Orkut Message' }
              td { t.orkut_message }
            end
          end
        end
      end
    end

    div({:class => 'panel' }) do
      h3 'Facebook Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table' }) do
          table do
            tr do
              th { 'Display Facebook' }
              td { t.display_facebook.to_s }
            end
            tr do
              th { 'Facebook Title' }
              td { t.facebook_title }
            end
            tr do
              th { 'Facebook Link' }
              td { t.facebook_link }
            end
            tr do
              th { 'Facebook Message' }
              td { t.facebook_message }
            end
            tr do
              th { 'Facebook Image' }
              td { image_tag(t.facebook_image.url) }
            end
          end
        end
      end
    end

    div({:class => 'panel' }) do
      h3 'Twitter Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table' }) do
          table do
            tr do
              th { 'Display Twitter' }
              td { t.display_twitter.to_s }
            end
            tr do
              th { 'Twitter Tweet' }
              td { t.tweet }
            end
            tr do
              th { 'Twitter Link' }
              td { t.twitter_url }
            end
          end
        end
      end
    end
  end
end
