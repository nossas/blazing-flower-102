# encoding: utf-8
class ChangeZonaValues < ActiveRecord::Migration
  def up
    Member.where(:zona => "Eu não sou do Rio").each do |m|
      m.update_attributes({:zona => "Outra localidade"})
    end
  end

  def down
    Member.where(:zona => "Outra localidade").each do |m|
      m.update_attributes({:zona => "Eu não sou do Rio"})
    end
  end
end
