class IdeaCategory < ActiveRecord::Base

  belongs_to :issue
  has_many :ideas, :dependent => :destroy 
  validates_presence_of :name, :badge
  validates_uniqueness_of :name

  scope :with_ideas, where("id IN (SELECT DISTINCT category_id FROM ideas)")

  mount_uploader :badge, BadgeUploader

  def css_class
    name.parameterize
  end

  def as_json(options={})
    {
      :id => id,
      :name => name,
      :badge => badge.url,
      :css_class => css_class
    }
  end

end
