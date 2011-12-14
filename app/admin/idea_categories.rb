# coding: utf-8
ActiveAdmin.register IdeaCategory do
  menu :priority => 3, :label => "Categorias"

  filter :name, :label => "Nome"


  index do
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
    f.inputs "Editar Categoria" do
      f.input :name, :as => :string, :label => "Nome"
      f.input :badge, :as => :file, :label => "Badge"
      f.buttons
    end
  end

  show do
    div :class => :panel do
      h3 "Detalhe da categoria"
      div :class => :panel_contents do
        div :class => :attributes_table do
          table do
            tr do
              th { "Nome" }
              td { idea_category.name }
            end
            tr do
              th { "Badge" }
              td { image_tag idea_category.badge.url }
            end
            tr do
              th { "Created at" }
              td { l idea_category.created_at, :format => :short }
            end
            tr do
              th { "Updated at" }
              td { l idea_category.updated_at, :format => :short }
            end
          end
        end
      end
    end
  end
end
