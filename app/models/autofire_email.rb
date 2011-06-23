class AutofireEmail < ActiveRecord::Base
  belongs_to :petition

  validates_presence_of :from
  validates_presence_of :subject
  validates_presence_of :message
end
