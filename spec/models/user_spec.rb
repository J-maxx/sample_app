require 'spec_helper'

  describe User do

    before(:each) do
      @attr = {:name => "Sample User",
               :email => "user@example.com",
               :password => "foobar",
               :password_confirmation => "foobar"
               }
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

    it "Should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  
  describe "passwords" do
    
    before(:each) do
      @user=User.new(:attr)
    end
    
    it "Should have a passwords attribute" do
      @user.should respond_to(:password)
    end

    it "Should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "",:password_validation => "")).
        should_not be_valid
      end
  
    it "should require a password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
      end
      
    it "should reject short passwords" do
      short="a" * 5
      hash=@attr.merge(:password => short, :password_confirmation => short )
      User.new(hash).should_not be_valid
    end
    
    it "should reject long passwords" do
        long="a" * 41
        hash=@attr.merge(:password => long, :password_confirmation => long )
        User.new(hash).should_not be_valid
    end  
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user=User.create!(@attr)
    end
    
    it "should have encrypted password attribute" do
      @user.should respond_to(:encrypted_password )
    end
  end
end
