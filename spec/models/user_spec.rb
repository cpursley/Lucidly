require 'spec_helper'

describe User do
  before { @user = User.new(email: "author@author.com", password: "123123123", password_confirmation: "123123123", fullname: "Dream Author", shortbio: "As a lucid dreamer...", weburl: "http://www.lucidauthor.com" ) }
  subject { @user }

  it "should respond to 'email'" do
    expect(@user).to respond_to(:email)
  end
  it "should respond to 'fullname'" do
    expect(@user).to respond_to(:fullname)
  end
  it "should respond to 'shortbio'" do
    expect(@user).to respond_to(:shortbio)
  end
  it "should respond to 'weburl'" do
    expect(@user).to respond_to(:weburl)
  end
  
  it "should be valid" do
    expect(@user).to be_valid
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end
  describe "when fullname is not present" do
    before { @user.fullname = " " }
    it { should_not be_valid }
  end
  
  describe "when email is too long" do
    before { @user.email = "a" * 36 }
    it { should_not be_valid }
  end
  describe "when fullname is too long" do
    before { @user.fullname = "a" * 36 }
    it { should_not be_valid }
  end
  describe "when shortbio is too long" do
    before { @user.shortbio = "a" * 501 }
    it { should_not be_valid }
  end
  describe "when weburl is too long" do
    before { @user.weburl = "a" * 51 }
    it { should_not be_valid }
  end
end