# coding: utf-8
ActiveAdmin.register IdeaHelpMethod do
  menu :label => "Métodos de ajuda", :parent => "Imagine", :priority => 0

  filter :name, :label => "Nome"
  filter :issue, :as => :select, :label => "Campanha", :collection => lambda { Issue.all }


  index do
    column :issue
    column :name
    column "Ideas" do |i|
      span i.ideas.count
    end
    column :created_at do |m|
     l m.created_at, :format => :short
    end
    default_actions
  end

  form do |f|
    f.inputs "Editar Método" do
      f.input :issue, :as => :select, :label => "Campanha"
      f.input :name, :as => :string, :label => "Nome"
      f.buttons
    end
  end

  show do
    div :class => :panel do
      h3 "Detalhe do Método"
      div :class => :panel_contents do
        div :class => :attributes_table do
          table do
            tr do
              th { "Issue" }
              td { idea_help_method.issue.name }
            end
            tr do
              th { "Nome" }
              td { idea_help_method.name }
            end
           tr do
              th { "Created at" }
              td { l idea_help_method.created_at, :format => :short }
            end
            tr do
              th { "Updated at" }
              td { l idea_help_method.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end
end
