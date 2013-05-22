require 'spec_helper'

describe NotesController do
  describe 'POST #create' do
    context 'as a logged in user' do
      before(:each) do
        @user = User.create!(:username => 'Phillimus')
        @trip = @user.trips.build(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
        @trip.save

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

  describe 'DELETE #destroy' do
    before do
      @user = User.create!(username: 'rafi')
      @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
      @note = @user.notes.build(:text => 'herro')
      @note.trip = @trip
      @note.save
    end

    context 'as a logged-in user' do
      before do
        controller.stub(:current_user).and_return(@user)
      end

      it 'can deleted notes' do
        expect do
          delete :destroy, { :trip_id => @trip.id, :id => @note.id }
        end.to change { Note.count }.by -1
      end
    end

    context 'without a current user' do
      it 'redirects to root path' do
        delete :destroy, { :trip_id => @trip.id, :id => @note.id }
        expect(response).to redirect_to root_path
      end
    end
  end
end
