class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  attr_accessible :title, :teaser, :body, :version, :changelog, :user_id, :message, :freezebody, :state, :submitted, :accepted, :tag_list
 
  acts_as_taggable

  validates :user_id, :presence => true
  validates :title, :presence => true, :length => { :maximum => 80 }
  validates :teaser, :presence => true, :length => { :maximum => 500 }
  validates :body, :presence => true
  validates :version, :length => { :maximum => 120 }
  validates :changelog, :length => { :maximum => 2000 }
  validates :message, :length => { :maximum => 5000 }
  validates :state, :presence => true, :numericality => true, :inclusion => { :in => 0..4 }


def self.search(search) 
  if search 
    where('title LIKE ? or teaser LIKE ?', "%#{search}%", "%#{search}%") 
  else 
    scoped 
  end 
end

def self.recent
  where('created_at > ?', Time.now-30.days.ago).order("created_at desc").first(5)
end

  protected
    def record_not_found
      flash[:error] = 'The dream you requested could not be found.'
      redirect_to root_url
    end  
end