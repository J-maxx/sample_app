require 'spec_helper'

  describe "LayoutLinks" do

    it "Should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

    it "Should have a contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end
    
    it "Should have an about page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
    it "Should have a help page at '/help'" do 
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
    it "Should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => 'Sign Up')
    end
    
    it "Should have the right links on the layout" do
      visit root_path
      response.should have_selector('title', :content => 'Home')
      click_link 'About'
      response.should have_selector('title', :content => 'About')
      click_link 'Contact'
      response.should have_selector('title', :content => 'Contact')
      click_link 'Home'
      response.should have_selector('title', :content => 'Home')
      click_link 'Sign Up Now'
      response.should have_selector('title', :content => 'Sign Up')
      response.should have_selector('a[href="/"]>img')
    end
    
end
