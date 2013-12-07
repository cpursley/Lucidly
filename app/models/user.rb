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

  validates :email, presence: true, :length => { :maximum => 35 }
  validates :fullname, presence: true, :length => { :maximum => 35 }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :shortbio, :length => { :maximum => 500 }
  validates :weburl, :url => {:allow_blank => true}, :length => { :maximum => 50 }
end