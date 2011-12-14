# coding: utf-8
ActiveAdmin.register IdeaCategory do
  menu :priority => 3, :label => "Categorias"

  filter :name, :label => "Nome"


  index do
    column :name
    column "Ideias" do |i|
      span i.ideas.count
    end
    column :created_at do |m|
     l m.created_at, :format => :short
    end
    default_actions
  end

  form do |f|
    f.inputs "Detalhes" do
      f.input :name, :as => :string
      f.input :badge, :as => :file
      f.buttons
    end
  end

  show do
    div :class => :panel do
      h3 "Idea Category Detail"
      div :class => :panel_contents do
        div :class => :attributes_table do
          table do
            tr do
              th { "Name" }
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
