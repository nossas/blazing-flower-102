ActiveAdmin.register Petition do
  filter :state, :as => :select, :collection => ['draft', 'published', 'archived', 'deactivated']
  filter :title
  filter :custom_path
  filter :headline

  controller do
    def preview
      @petition = Petition.where(:id => params[:id]).first
      @taf = @petition.taf
      @petition_signature = PetitionSignature.new
      @member = Member.new
      @comments = []

      if @petition.published?
        redirect_to custom_petition_path(@petition.custom_path)
      else
        flash[:notice] = "You're currently viewing the preview of this petition. To publish it, please go back to the Edit page and change its state to Published."
        render "petitions/show", :layout => 'application'
      end
    end
  end

  show do
    div({:class => 'panel' }) do
      h3 'Petition Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table petition' }) do
          table do
            tr do
              th do
                'Title'
              end
              td do
                petition.title
              end
            end
            tr do
              th do
                'Custom Path'
              end
              td do
                petition.custom_path
              end
            end
            tr do
              th do
                'Headline'
              end
              td do
                petition.headline
              end
            end
            tr do
              th do
                'Description'
              end
              td do
                petition.description
              end
            end
            tr do
              th do
                'Short Description'
              end
              td do
                petition.short_description
              end
            end
            tr do
              th do
                'Media'
              end
              td do
                raw petition.media
              end
            end
            tr do
              th do
                'Call to Action Headline'
              end
              td do
                petition.call_to_action_headline
              end
            end
            tr do
              th do
                'Call to Action Button'
              end
              td do
                petition.call_to_action
              end
            end
            tr do
              th do
                'Call to Action Text'
              end
              td do
                petition.call_to_action_text
              end
            end
          end
        end
      end
    end

    div({:class => 'panel' }) do
      h3 'Counter'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table petition' }) do
          table do
            tr do
              th do
                'Display Counter?'
              end
              td do
                petition.display_counter == true ? "Yes" : "No"
              end
            end
            tr do
              th do
                'Counter Threshold'
              end
              td do
                petition.counter_threshold.to_s
              end
            end
            tr do
              th do
                'Counter Goal'
              end
              td do
                petition.counter_goal.to_s
              end
            end
          end
        end
      end

      div({:class => 'panel' }) do
        h3 'Comments'
        div({:class => 'panel_contents' }) do
          div({:class => 'attributes_table petition' }) do
            table do
              tr do
                th do
                  'Display Comments?'
                end
                td do
                  petition.display_comment_field == true ? "Yes" : "No"
                end
              end
              tr do
                th do
                  'Comment Question'
                end
                td do
                  petition.comment_question
                end
              end
              tr do
                th do
                  'Surface Comments?'
                end
                td do
                  petition.surface_comments == true ? "Yes" : "No"
                end
              end
            end
          end
        end
      end
    end
  end

  index do
    column :title
    column :state
    column :custom_path
    column 'Autofire Email' do |p|
      if p.autofire_email
        link_to "Edit Email", edit_admin_autofire_email_path(p.autofire_email)
      else
        link_to "Create Email", new_admin_autofire_email_path
      end
    end
    column 'TAF' do |p|
      if p.taf
        link_to "Edit TAF", edit_admin_taf_path(p.taf)
      else
        link_to "Create TAF", new_admin_taf_path
      end
    end
    column "Options" do |e| 
      span link_to 'Show', admin_petition_path(e)
      span link_to 'Edit', edit_admin_petition_path(e)
      if e.draft?
        span link_to 'Preview', admin_preview_petition_path(e)
      end
    end
  end

  form do |f|
    f.inputs "Campaign Information" do
      f.input :title, :as => :string
      f.input :custom_path, :as => :string
    end

    f.inputs "Petition Information" do
      if f.object.complete?
        f.input :state, :as => :select, :collection => (f.object.state_transitions.map{ |t| t.to_name } << f.object.state)
      end
      f.input :headline, :as => :string
      f.input :description
      f.input :media
      f.input :media_caption, :as => :string
      f.input :call_to_action_headline, :as => :string
      f.input :call_to_action_text
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
