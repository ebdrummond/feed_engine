require 'spec_helper'

describe NotesController do
  describe 'POST #create' do
    context 'as a logged in user' do
      before(:each) do
        @user = User.create!(:username => 'Phillimus')
        @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
        controller.stub(:current_user).and_return(@user)
      end

      context 'with corrects params' do
        let(:params) { {:trip_id => @trip.id, :note => { :text => 'Oh hai'} } }

        it 'creates a new note' do
          expect { post :create, params }.to change { @user.notes.count }.by 1
        end
      end

      context 'without a note' do
        let(:params) { {:trip_id => @trip.id } }

        it 'redirects back to trip if exists given' do
          post :create, params
          expect(response).to redirect_to trip_path(@trip.id)
        end
      end

      context 'with a missing or invalid trip' do
        let(:params) { {:note => {:trip_id => 2, :text => nil}} }

        it 'raises a routing error' do
          expect { post :create }.to raise_error ActionController::RoutingError
        end
      end
    end

    context 'as an anonymous user' do
      it 'raises a routing error' do
        expect { post :create }.to raise_error ActionController::RoutingError
      end
    end
  end
end
