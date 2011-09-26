# coding: utf-8
ActiveAdmin.register Job do
  menu :priority => 11, :label => 'Empregos'
  index do
    column :title
    column :active
    column :created_at do |m|
      l m.created_at, :format => :short
    end
    default_actions
  end

  form do |f|
    f.inputs "Job" do
      f.input :title, :as => :string
      f.input :description
      f.input :active
    end

    f.buttons
  end
  
  show do
    div({:class => 'panel'}) do
      h3 'Job Details'
      div({:class => 'panel_contents' }) do
        div({:class => 'attributes_table issue'  }) do
          table do
            tr do
              th do
                'Title'
              end
              td do 
                job.title
              end
              tr do 
                th do
                  'Description'
                end
                td do
                  raw(job.description)
                end
              end
              tr do
                th do
                  'Active'
                end
                td do
                  job.active.to_s
                end
              end
              tr do
                th { 'Created at' }
                td { l job.created_at, :format => :short }
              end
              tr do
                th { 'Updated at' }
                td { l job.updated_at, :format => :short }
              end
            end
          end
        end
      end
    end
  end
end
