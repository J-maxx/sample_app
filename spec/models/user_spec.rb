require 'spec_helper'

describe User do

  before(:each) do
    @attr = {:name => "Sample User",:email => "user@example.com"}
  end

  it "Should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "Should have a name" do
    no_name_user=User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end  

  it "Should have an e-mail" do
    no_email_user=User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "Should reject names that are too long" do
    long_name="a" * 51
    long_name_user=User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
     
  it "Should accept valid email addresses" do
    addresses = %w[user@example.com NEW_USER@user.com first.last@user.new.org]
    addresses.each do |address|
      valid_email_user=User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "Should reject invalid email addresses" do
    addresses = %w[user@example,com new_user_at_user.com first.last@user.]
    addresses.each do |address|
      invalid_email_user=User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "Should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

end
