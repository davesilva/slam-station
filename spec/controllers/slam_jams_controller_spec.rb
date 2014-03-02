require 'spec_helper' 

describe SlamJamsController do 
  let(:slam_jam) { FactoryGirl.create(:slam_jam) } 

  describe "POST #like" do
    context "when liking" do 
      before(:each) do 
        attrs = { :liked => 'false' }
        xhr :post, :like, :id => slam_jam.id, :slam_jam => attrs
      end

      it { should respond_with(:success) }  
    end

    context "when unliking" do 
      before(:each) do 
        attrs = { :liked => 'true' }
        xhr :post, :like, :id => slam_jam.id, :slam_jam => attrs
      end

      it { should respond_with(:success) } 
    end
  end

  describe "POST #dislike" do
    context "when disliking" do
      before(:each) do 
        attrs = { :disliked => 'false' } 
        xhr :post, :dislike, :id => slam_jam.id, :slam_jam => attrs 
      end 
      
      it { should respond_with(:success) } 
    end

    context "when undisliking" do
      before(:each) do 
        attrs = { :disliked => 'true' } 
        xhr :post, :dislike, :id => slam_jam.id, :slam_jam => attrs 
      end

      it { should respond_with(:success) } 
    end
  end
end