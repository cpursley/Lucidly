# User Seeds

User.delete_all
Dream.delete_all

# Admin User
@user1 = User.create! :email => 'chasepursley@gmail.com', :password => '123123123', :fullname => 'Chase Pursley'
@user1.save!

# Users
@users = [
  {
  email: 'usera@gmail.com', 
  password: '123123123', 
  fullname: 'User A',
  },
  {
  email: 'userb@gmail.com', 
  password: '123123123', 
  fullname: 'User B',
  },
  {
  email: 'userc@gmail.com', 
  password: '123123123', 
  fullname: 'User C',
  },
  {
  email: 'userd@gmail.com', 
  password: '123123123', 
  fullname: 'User D',
  }
]

def create_users
  @users.each do |hash|
    u = User.create hash
    u.save!
  end
end

create_users()
  
# Dreams ~ refactor into hash at some point. Maybe use a factory...
@dream1 = @user1.dreams.create! :title => 'Dream 1', :state => 0, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 1.day, :teaser => "Dream 1 Teaser", :body => "Dream 1 Body"
@dream1.save!
@dream2 = @user1.dreams.create! :title => 'Dream 2', :state => 1, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 2.day, :teaser => "Dream 2 Teaser", :body => "Dream 2 Body"
@dream2.save!
@dream3 = @user1.dreams.create! :title => 'Dream 3', :state => 2, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 3.day, :teaser => "Dream 3 Teaser", :body => "Dream 3 Body"
@dream3.save!
@dream4 = @user1.dreams.create! :title => 'Dream 4', :state => 3, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 4.day, :teaser => "Dream 4 Teaser", :body => "Dream 4 Body"
@dream4.save!
@dream5 = @user1.dreams.create! :title => 'Dream 5', :state => 4, :message => '', :version => 'Version Info', :changelog => 'Changelog', :submitted => Time.now, :accepted => Time.now + 5.day, :teaser => "Dream 5 Teaser", :body => "Dream 5 Body"
@dream5.save!