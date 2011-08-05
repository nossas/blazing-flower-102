ActiveAdmin.register Member do
  filter :first_name
  filter :last_name
  filter :email
  filter :zona

  index do
    column :first_name
    column :last_name
    column :email
    column :zona
    column "Options" do |o|
      span link_to "Show", admin_issue_path(o)
      span link_to "Edit", edit_admin_issue_path(o)
    end
  end
end
