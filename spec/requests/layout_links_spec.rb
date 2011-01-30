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

end
