require 'spec_helper'

describe Admin::SlamJamsController do
  let(:slam_jam) { FactoryGirl.create(:slam_jam) }

  let(:valid_attributes) { FactoryGirl.attributes_for(:slam_jam) }

  describe 'GET index' do
    before { get :index }

    it { should respond_with(:success) }
    specify { assigns(:slam_jams).should == [slam_jam] }
  end

  describe 'GET new' do
    before { get :new }

    it { should respond_with(:success) }
    specify { assigns(:slam_jam).should be_a_new(SlamJam) }
  end

  describe 'GET edit' do
    before { get :edit, id: slam_jam.id }

    it { should respond_with(:success) }
    specify { assigns(:slam_jam).should == slam_jam }
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new SlamJam' do
        expect {
          post :create, { slam_jam: valid_attributes }
        }.to change(SlamJam, :count).by(1)
      end

      it 'assigns a newly created slam_jam as @slam_jam' do
        post :create, slam_jam: valid_attributes
        assigns(:slam_jam).should be_a(SlamJam)
        assigns(:slam_jam).should be_persisted
      end

      it 'redirects to the index' do
        post :create, slam_jam: valid_attributes
        response.should redirect_to(admin_slam_jams_url)
      end
    end

    describe 'with invalid params' do
      before { post :create, slam_jam: valid_attributes.except(:youtube_id) }

      it 'assigns a newly created but unsaved slam_jam as @slam_jam' do
        assigns(:slam_jam).should be_a_new(SlamJam)
        assigns(:slam_jam).should_not be_persisted
      end

      it 're-renders the "new" template' do
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      before do
        put :update, id: slam_jam.id,
                     slam_jam: { artist: 'Tears for Fears' }
      end

      it 'assigns the requested slam_jam as @slam_jam' do
        assigns(:slam_jam).should eq(slam_jam)
      end

      it 'redirects to the index' do
        response.should redirect_to(admin_slam_jams_url)
      end
    end

    describe 'with invalid params' do
      before do
        put :update, id: slam_jam.id,
                     slam_jam: { youtube_id: '' }
      end

      it 'assigns the slam_jam as @slam_jam' do
        assigns(:slam_jam).should eq(slam_jam)
      end

      it 're-renders the "edit" template' do
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      slam_jam.save!
    end

    it 'destroys the requested slam_jam' do
      expect {
        delete :destroy, id: slam_jam.id
      }.to change(SlamJam, :count).by(-1)
    end

    it 'redirects to the slam_jams list' do
      delete :destroy, id: slam_jam.id
      response.should redirect_to(admin_slam_jams_url)
    end
  end

end
