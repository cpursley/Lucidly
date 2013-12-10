class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :dream

  attr_accessible :dream_id, :body, :user_id

  validates :user_id, :presence => true
  validates :dream_id, :presence => true
  validates :body, :presence => true, :length => { :maximum => 50000 }

  default_scope :order => 'comments.created_at asc'
end
