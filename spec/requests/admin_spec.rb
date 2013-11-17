require 'spec_helper'
=begin
describe "security", :type => :feature do
  it "signs admin user in" do
    visit new_sessions_path
    fill_in "email", :with => "admin@admin.com"
    fill_in "password", :with => "123123123"
    click_button "Sign In"
    page.should have_content('')
  end
end
=end