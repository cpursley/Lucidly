require 'spec_helper'

describe "Dreams" do
  
  subject { page }
  
  describe "About Page" do
    before { visit about_dreams_path }
    it { should have_content("lucidly") }
    it { should have_content("A dream journal.") }
    it { should have_content("about") }
  end
  
end
