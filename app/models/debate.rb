class Debate < ActiveRecord::Base
  belongs_to :issue
  belongs_to :author_1, :class_name => 'Member', :foreign_key => :author_email_side_1, :primary_key => :email
  belongs_to :author_2, :class_name => 'Member', :foreign_key => :author_email_side_2, :primary_key => :email

  has_many :comments, :as => :commentable
  has_many :members, :through => :comments

  validates_presence_of :issue

  validate :authors_are_members
  validates_presence_of :title
  validates_presence_of :question
  validates_presence_of :comment_prompt
  validates_presence_of :author_email_side_1
  validates_presence_of :author_email_side_2


  def authors_are_members
    errors.add(:author_email_side_1, "Author must be an existing member of Meu Rio") if Member.where(:email => self.author_email_side_1).empty?
    errors.add(:author_email_side_2, "Author must be an existing member of Meu Rio") if Member.where(:email => self.author_email_side_2).empty?
  end

  def distinct_member_count
    members.count(:distinct => true)
  end
end
