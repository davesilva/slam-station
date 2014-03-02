require 'spec_helper'

describe ApplicationController do
  describe "#current_or_guest_user" do
    controller do
      def index
        current_or_guest_user
        render :nothing => true
      end
    end

    context "with no set session" do
      before { get :index }

      it "writes to the session variable" do
        session[:login].should_not be_blank
      end

      it "creates a session user" do
        User.find_by(:uuid => session[:login]).should_not be_nil
      end
    end

    context "with a set session" do
      it "loads the previously created user" do
        get :index
        alpha = User.find_by(:uuid => session[:login])
        get :index
        beta = User.find_by(:uuid => session[:login])

        alpha.should == beta
      end
    end
  end
end
