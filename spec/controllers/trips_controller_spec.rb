require 'spec_helper'

describe TripsController do
  describe "GET #new" do
    context 'as a logged-in user' do
      before(:each) { controller.stub(:require_login).and_return(true) }

      it 'assigns a new trip variable' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context 'as an anonymous user' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "POST #create" do
    context 'as a logged-in user' do
      before(:each) { controller.stub(:current_user).and_return(User.create!(username: 'kyle')) }

      context 'with correct params' do
        before(:each) do
          post :create, {"trip" =>
                          { "name"        => "Phil's birthday getaway",
                            "destination" => "Sau Paulo, Brazil",
                            "start"       => "2013-07-15",
                            "end"         => "2013-07-22",
                            "visible"     => "0"}}
        end

        it 'creates a new trip' do
          expect(Trip.count).to eq 1
        end

        it 'redirects to trip page' do
          expect(response).to redirect_to trip_path(1)
        end
      end

      context 'with incorrect params' do
        before(:each) do
          controller.stub(:current_user).and_return(User.create!(username: 'phil'))
        end

        it "raises an error" do
          expect { post :create, {"trip" =>
                                    { "name"    => "Phil's birthday getaway",
                                      "start"   => "2013-07-15",
                                      "end"     => "2013-07-22",
                                      "visible" => "0"}}
          }.to raise_error ActiveRecord::RecordInvalid
        end
      end
    end

    context 'as an anonymous user' do
      it 'redirects to root' do
        post :create
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'GET #show' do
    before(:each) do
      @user = User.create!(:username => 'kyle')
      @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    it 'does not require login' do
      get :show, {'id' => @trip.id}
      expect(response).to be_ok
    end

    it 'assigns the trip variable' do
      get :show, {'id' => @trip.id}
      expect(assigns(:trip)).to eq @trip
    end

    it 'assigns a new note variable' do
      get :show, {'id' => @trip.id}
      expect(assigns(:note)).to be_an_instance_of Note
    end
  end

  describe 'GET #edit' do
    before do
      @user = User.create!(:username => 'kyle')
      @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    it 'assigns a trip variable' do
      get :show, {'id' => @trip.id}
      expect(assigns(:note)).to be_an_instance_of Note
    end
  end

  describe 'PUT #update' do
    before do
      @user = User.create!(:username => 'kyle')
      @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
    end

    context 'happy path' do
      before do
        controller.stub(:require_login).and_return(true)
        put :update, { 'id' => @trip.id, :trip => { :name => 'new name'} }
      end

      it 'updates the trip' do
        @trip.reload
        expect(@trip.name).to eq 'new name'
      end

      it 'renders the edit view' do
        expect(response).to render_template(:edit)
      end
    end

    context 'sad path' do
      context 'as an anonymous user' do
        it 'redirects to root' do
          put :update, { 'id' => @trip.id, :trip => { :name => 'new name'} }
          expect(response).to redirect_to root_path
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      @user = User.create!(:username => 'kyle')
      @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      controller.stub(:require_login).and_return(true)
    end

    it 'deletes the trip' do
      expect do
        delete :destroy, { 'id' => @trip.id }
      end.to change { Trip.count }.by -1
    end

    it 'redirects to dashboard' do
      delete :destroy, { 'id' => @trip.id }
      expect(response).to redirect_to dashboard_path
    end
  end

  describe 'GET #dashboard' do
    context 'happy path' do
      before do
        @user = User.create!(:username => 'kyle')
        @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      end

      it 'assigns trips' do
        controller.stub(:current_user).and_return(@user)
        get :dashboard
        expect(assigns(:trips)).to eq [@trip]
      end

      it 'assigns kreepings' do
        user = User.create!(username: 'lola')
        controller.stub(:current_user).and_return(user)
        kreeping = user.user_trips.build(:trip_role => 'kreepr', :trip_id => @trip.id)
        kreeping.save

        get :dashboard
        expect(assigns(:kreepings)).to eq [@trip]
      end

      it 'assigns feed items' do
        controller.stub(:current_user).and_return(@user)
        get :dashboard
        expect(assigns(:feed_items)).to eq []
      end
    end

    context 'sad path' do
      context 'not logged-in' do
        it 'redirects to root' do
          get :dashboard
          expect(response).to redirect_to root_path
        end
      end
    end
  end
end
