require 'spec_helper'

describe "Dreams" do
  
  describe "About Page" do
    before { visit about_dreams_path }
    it "should have the content 'lucidly'" do
      expect(page).to have_content("lucidly")
    end
    it "should have the content 'A dream journal.'" do
      expect(page).to have_content("A dream journal.")
    end
    it "should have the content 'about'" do
      expect(page).to have_content("about")
    end
  end
  
end
