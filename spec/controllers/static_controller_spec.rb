require 'spec_helper' 

describe StaticController do 

  describe "GET 'home'" do 
    before { get :home } 

    it { should respond_with(:success) } 
    it { should render_template('home') }
  end
end
