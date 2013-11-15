class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :dreams, :dependent => :destroy
  has_many :comments, :dependent => :destroy 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :fullname, :shortbio, :weburl

  validates :weburl, :url => {:allow_blank => true}, :length => { :maximum => 50 }
  validates :fullname, :length => { :maximum => 40 }
  validates :shortbio, :length => { :maximum => 500 }

end