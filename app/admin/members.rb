# coding: utf-8
ActiveAdmin.register Member do
  menu :priority => 12, :label => 'Membros'

  filter :first_name
  filter :last_name
  filter :email
  filter :zona

  index do
    column "", :image_url do |m|
      image_tag m.image_url, :width => "20px" if m.image_url
    end
    column :first_name do |m|
      span link_to m.first_name, member_path(m)
    end
    column :email
    column :meu_rio_is
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    default_actions
  end

  show do
    div({:class => 'panel' }) do
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table member' }) do
          table do
            tr do
              th { Member.human_attribute_name :first_name }
              td { member.first_name }
            end
            tr do
              th { Member.human_attribute_name :last_name }
              td { member.last_name }
            end
            tr do
              th { Member.human_attribute_name :email }
              td { member.email }
            end
            tr do
              th { Member.human_attribute_name :zona }
              td { member.zona }
            end
            tr do
              th { Member.human_attribute_name :celular }
              td { member.celular }
            end
            tr do
              th { 'Image' }
              td { image_tag(member.current_image_url) }
            end
            tr do
              th { Member.human_attribute_name :image_url }
              td { member.current_image_url }
            end
            tr do
              th { "URL DO PERFIL" }
              td { member_path(member) }
            end
            tr do
              th { Member.human_attribute_name :meu_rio_is }
              td { member.meu_rio_is }
            end
            tr do
              th { Member.human_attribute_name :bio }
              td { member.bio }
            end
            tr do
              th { 'Created at' }
              td { l member.created_at, :format => :short }
            end
            tr do
              th { 'Updated at' }
              td { l member.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end

end
