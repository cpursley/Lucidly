require "spec_helper"

describe "Users" do

  subject { page }
=begin
  describe "User Signup" do
    before { visit new_user_registration_path }
    it { should have_content("sign up") }
  end

  describe "Author Profile Page" do
    before { visit user_path(user) }

    it "should have the content 'user name'" do
      expect(page).to have_content(user.name)
    end
    it "should have the title 'sign up'" do
      expect(page).to have_title(user.name)
    end
  end
=end
end
