ActiveAdmin.register Petition do
  menu :priority => 1

  filter :state, :as => :select, :collection => ['draft', 'published', 'archived', 'deactivated']
  filter :title
  filter :custom_path
  filter :headline

  controller do
    def preview
      @petition = Petition.where(:id => params[:id]).first
      @petition_signature = PetitionSignature.new
      @member = Member.new
      @comments = []

      if @petition.published?
        redirect_to custom_petition_path(@petition.custom_path)
      else
        flash[:preview] = "You're currently viewing the preview of this petition. To publish it, please go back to the Edit page and change its state to Published."
        render "petitions/show", :layout => 'application'
      end
    end

    def export
      @petition = Petition.where(:id => params[:id]).first
      @petition.export_to_csv
      flash[:notice] = "The list of signatures for the petition has been exported to Amazon Web Services."
      render :action => :index
    end
  end

  show do
    div({:class => 'panel' }) do
      h3 'Petition Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table petition' }) do
          table do
            tr do
              th { 'Title' }
              td { petition.title }
            end
            tr do
              th { 'Custom Path' }
              td { petition.custom_path }
            end
            tr do
              th { 'Issue' }
              td { petition.issue.name }
            end
            tr do
              th { 'Headline' }
              td { petition.headline }
            end
            tr do
              th { 'Description' }
              td { petition.description }
            end
            tr do
              th { 'Short Description' }
              td { petition.short_description }
            end
            tr do
              th { 'Media' }
              td { raw(petition.media) }
            end
            tr do
              th { 'Call to Action Headline' }
              td { petition.call_to_action_headline }
            end
            tr do
              th { 'Call to Action Button' }
              td { petition.call_to_action }
            end
            tr do
              th { 'Call to Action Text' }
              td { petition.call_to_action_text }
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
              th { 'Display Counter?' }
              td { petition.display_counter == true ? "Yes" : "No" }
            end
            tr do
              th { 'Counter Threshold' }
              td { petition.counter_threshold.to_s }
            end
            tr do
              th { 'Counter Goal' }
              td { petition.counter_goal.to_s }
            end
          end
        end
      end

      h3 'Comments'
      div({:class => 'panel' }) do
        div({:class => 'panel_contents' }) do
          div({:class => 'attributes_table petition' }) do
            table do
              tr do
                th { 'Display Comments?' }
                td { petition.display_comment_field == true ? "Yes" : "No" }
              end
              tr do
                th { 'Comment Question' }
                td { petition.comment_question }
              end
              tr do
                th { 'Surface Comments?' }
                td { petition.surface_comments == true ? "Yes" : "No" }
              end
            end
          end
        end
      end


      h3 'Donation'
      div({:class => 'panel' }) do
        div({:class => 'panel_contents' }) do
          div({:class => 'attributes_table petition' }) do
            table do
              tr do
                th { 'Display Donation?' }
                td { petition.display_donation == true ? "Yes" : "No" }
              end
              tr do
                th { 'Donation Thanks Message' }
                td { petition.donation_thanks_message }
              end
              tr do
                th { 'Donation Headline' }
                td { petition.donation_headline }
              end
              tr do
                th { 'Donation Text' }
                td { petition.donation_text }
              end
            end
          end
        end
      end

    end
  end

  index do
    column 'Title' do |p|
      if p.state == ('published' || 'archived')
        link_to p.title, custom_petition_path(p.custom_path)
      else
        "#{p.title}"
      end
    end
    column 'Issue' do |p|
      p.issue.name
    end
    column :state
    column 'Custom path' do |p|
      if p.state == ('published' || 'archived')
        link_to p.custom_path, custom_petition_path(p.custom_path)
      else
        "#{p.custom_path}"
      end
    end
    column 'Autofire Email' do |p|
      if p.autofire_email
        link_to "Edit Email", edit_admin_autofire_email_path(p.autofire_email)
      else
        link_to "Create Email", new_admin_autofire_email_path
      end
    end
    column 'TAF' do |p|
      if p.display_donation
        span 'Disable the donation to use a TAF'
      elsif p.taf
        link_to "Edit TAF", edit_admin_taf_path(p.taf)
      else
        link_to "Create TAF", new_admin_taf_path
      end
    end
    column "Signatures" do |p|
      span p.members.count
    end
    column "Options" do |e| 
      span link_to 'Show', admin_petition_path(e)
      span link_to 'Edit', edit_admin_petition_path(e)
      if e.draft?
        span link_to 'Preview', admin_preview_petition_path(e)
      end
      unless e.draft?
        span link_to 'Export Signatures', admin_export_petition_path(e), :class => "export_signatures"
      end
    end
  end

  form do |f|
    f.inputs "Campaign Information" do
      f.input :title, :as => :string
      f.input :custom_path, :as => :string
      f.input :issue
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

    f.inputs "Donation Settings" do
      f.input :display_donation
      f.input :donation_thanks_message, :as => :string
      f.input :donation_headline, :as => :string
      f.input :donation_text
    end

    f.buttons
  end
end
