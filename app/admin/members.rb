ActiveAdmin.register Member do
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
end
