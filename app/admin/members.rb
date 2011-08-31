ActiveAdmin.register Member do
  menu :priority => 12

  filter :first_name
  filter :last_name
  filter :email
  filter :zona

  index do
    column :first_name
    column :last_name
    column :email
    column :meu_rio_is
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    column "Options" do |o|
      span link_to "Show", admin_member_path(o)
      span link_to "Edit", edit_admin_member_path(o)
    end
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
              th { Member.human_attribute_name :image_url }
              td { member.image_url }
            end
            tr do
              th { Member.human_attribute_name :meu_rio_is }
              td { member.meu_rio_is }
            end
            tr do
              th { Member.human_attribute_name :bio }
              td { member.bio }
            end
          end
        end
      end
    end
  end

end
