User.delete_all
Dream.delete_all

# Admin User
puts "Seeding Admin..."
@user1 = User.create! email: 'admin@admin.com', password: '123123123', fullname: 'Admin User'
@user1.save!
puts "Admin email: admin@admin.com"
puts "Admin password: 123123123"
puts "Admin view route domain.com/admin"

# Author User
puts "Seeding Author..."
@user2 = User.create!email: 'author@author.com', password: '123123123', fullname: 'Dream Author'
@user2.save!

# Dreams
puts "Seeding Dreams..."
40.times do |i|
  d = @user2.dreams.create! :title => "Dream #{i}", :state => (rand(0..4)), :message => "", :version => "Version #{i} Info", :changelog => "Changelog #{i}", :submitted => Time.now, :accepted => Time.now + 1.day, :teaser => "Dream #{i} Teaser", :body => "Dream #{i} Body"
  d.save!
end