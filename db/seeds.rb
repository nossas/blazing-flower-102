# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FeaturedContentWidget.create!([
  {:link => 'http://meurio.org.br', :title => 'Featured Content Widget 1'},
  {:link => 'http://meurio.org.br', :title => 'Featured Content Widget 2'}
])
puts "#{FeaturedContentWidget.count} Featured Content Widget(s) created"

LegislativeAgendaWidget.create!([
  {:html_content => "--"}
])
puts "#{LegislativeAgendaWidget.count} Legislative Agenda Widget(s) created"

MeuRioIsWidget.create!([
  {:html_content => "--"}
])
puts "#{MeuRioIsWidget.count} MeuRio Is Widget(s) created"

MeuRioTeamWidget.create!([
  {:html_content => "--"}
])
puts "#{MeuRioTeamWidget.count} MeuRio Team Widget(s) created"

PublicHearingWidget.create!([
  {:html_content => "--"}
])
puts "#{PublicHearingWidget.count} Public Hearing Widget(s) created"

# RAMIFY see
issue = Issue.create! :name => "Meu Rio Imagine", :description => "There is a theory in evolutionary biology that reciprocal altruism and cooperation first appeared as a solution to the food storage problem.", :image_file_name => "sample.jpg", :thumbnail_file_name => "sample.jpg"

category_1 = IdeaCategory.create :name => "Mobilidade urbana", :issue => issue
category_1.badge.store!(File.open(File.join(Rails.root, "lib/fixtures/mobilidade.png")))
category_1.save!


category_2 = IdeaCategory.create :name => "Violência", :issue => issue
category_2.badge.store!(File.open(File.join(Rails.root, "lib/fixtures/violencia.png")))
category_2.save!


category_3 = IdeaCategory.create :name => "Catástrofes naturais", :issue => issue
category_3.badge.store!(File.open(File.join(Rails.root, "lib/fixtures/catastrofes.png")))
category_3.save!



idea_1 = Idea.create! :issue_id => issue.id, :member => member, :category => category_1, :title => "Circuito de webcams entre vizinhos", :headline => "Criar um sistema de monitoramento dos espaços públicos através de webcams.", :featured => true, :recommended => true, :document => { :description => "Descrição da ideia", :have => "O que eu já tenho", :need => "O que eu preciso" }



idea_2 = Idea.create! :issue_id => issue.id, :member => member, :category => category_2, :title => "Circuito de webcams entre vizinhos", :headline => "Criar um sistema de monitoramento.", :featured => true, :recommended => true, :document => { :description => "Descrição da ideia", :have => "O que eu já tenho", :need => "O que eu preciso" }


idea_3 = Idea.create! :issue_id => issue.id, :member => member, :category => category_3, :title => "Circuito de webcams entre vizinhos", :headline => "Criar um sistema de monitoramento.", :featured => true, :recommended => true, :document => { :description => "Descrição da ideia", :have => "O que eu já tenho", :need => "O que eu preciso" }

