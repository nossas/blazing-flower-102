# coding: utf-8
ActiveAdmin.register PetitionSignature, :as => 'PetitionComment' do
  menu :parent => 'Petições', :label => 'Comentários', :priority => 0

  actions :all, :except => :new
  filter :petition, :label => 'Petição'
  filter :created_at, :label => 'Criado em'

  scope :unmoderated, :default => true
  scope :moderated

  member_action :accept_comment do
    PetitionSignature.find(params[:id]).accept_comment
    return redirect_to(:back)
  end
  member_action :reject_comment do
    PetitionSignature.find(params[:id]).reject_comment
    return redirect_to(:back)
  end

  collection_action :already_moderated do
    span b 't'
  end
  
  index do
    column :comment, :sortable => false
    column 'Petição' do |c|
      c.petition.title
    end
    column :created_at, :label => 'Criado em' do |m|
      l m.created_at, :format => :short
    end
    column :comment_accepted, :sortable => :comment_accepted, :label => 'Aceito?' do |ps|
      if ps.comment_accepted
        span b 'Sim'
      else
        span link_to('Sim', accept_comment_admin_petition_comment_path(ps))
      end
      if ps.comment_accepted.nil? or ps.comment_accepted
        span link_to('Não', reject_comment_admin_petition_comment_path(ps))
      else
        span b 'Não'
      end
    end
  end
  
end
