# require 'spec_helper'

# describe TripsController do
#   describe "GET #new" do
#     context 'as a logged-in user' do
#       before(:each) { controller.stub(:require_login).and_return(true) }

#       it 'assigns a new trip variable' do
#         get :new
#         expect(response).to render_template(:new)
#       end
#     end

#     context 'as an anonymous user' do
#       it 'redirects to login page' do
#         get :new
#         expect(response).to redirect_to(root_path)
#       end
#     end
#   end

#   describe "POST #create" do
#     context 'as a logged-in user' do
#       before(:each) { controller.stub(:current_user).and_return(User.create!(username: 'kyle')) }

#       context 'with correct params' do
#         before(:each) do
#           post :create, {"trip" =>
#                           { "name"        => "Phil's birthday getaway",
#                             "destination" => "Sau Paulo, Brazil",
#                             "start"       => "2013-07-15",
#                             "end"         => "2013-07-22",
#                             "visible"     => "0"}}
#         end

#         it 'creates a new trip' do
#           expect(Trip.count).to eq 1
#         end

#         it 'redirects to dashboard' do
#           expect(response).to redirect_to dashboard_path
#         end
#       end

#       context 'with incorrect params does not create a new trip' do
#         before(:each) do
#           post :create, {"trip" =>
#                           { "name"    => "Phil's birthday getaway",
#                             "start"   => "2013-07-15",
#                             "end"     => "2013-07-22",
#                             "visible" => "0"}}
#         end

#         it "does not create a new trip" do
#           expect(Trip.count).to eq 0
#         end

#         it "renders the new template" do
#           expect(response).to render_template :new
#         end
#       end
#     end

#     context 'as an anonymous user' do
#       it 'redirects to root' do
#         post :create
#         expect(response).to redirect_to root_path
#       end
#     end
#   end

#   describe 'GET #dashboard' do
#     xit 'does something' do
#     end
#   end

#   describe 'GET #show' do
#     before(:each) do
#       @user = User.create!(:username => 'kyle')
#       @trip = @user.trips.create!(:name => "Phil's Getaway", :destination => 'Munich, Germany', :start => Date.parse('2013-02-20'), :end => Date.parse('2013-02-25'))
#     end

#     it 'renders the show template' do
#       get :show, {'id' => @trip.id}
#       expect(response).to render_template :show
#     end

#     it 'assigns the trip variable' do
#       get :show, {'id' => @trip.id}
#       expect(assigns(:trip)).to eq @trip
#     end

#     it 'assigns a new note variable' do
#       get :show, {'id' => @trip.id}
#       expect(assigns(:note)).to be_an_instance_of Note
#     end
#   end
# end
