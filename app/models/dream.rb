class Dream < ActiveRecord::Base
  attr_accessible :accepted, :body, :changelog, :freezebody, :message, :state, :submitted, :teaser, :title, :user_id, :version
end
