class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy 

  attr_accessible :title, :teaser, :body, :version, :changelog, :user_id, :message, :freezebody, :state, :submitted, :accepted
 
  validates :user_id, :presence => true
  validates :title, :presence => true, :length => { :maximum => 80 }
  validates :teaser, :presence => true, :length => { :maximum => 500 }
  validates :body, :presence => true
  validates :version, :length => { :maximum => 120 }
  validates :changelog, :length => { :maximum => 2000 }
  validates :message, :length => { :maximum => 5000 }
  validates :state, :presence => true, :numericality => true, :inclusion => { :in => 0..1 }

  protected
    def record_not_found
      flash[:error] = 'The dream you requested could not be found.'
      redirect_to root_url
    end  
end