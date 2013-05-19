class NotesController < ApplicationController
  before_filter :require_login

  def create
    trip_id = params[:note] ? params[:note][:trip_id] : nil
    trip = current_user.trips.find(trip_id)
    note = current_user.notes.build(params[:note].merge(:trip_id => trip.id))

    if note.save
      redirect_to trip_path(note.trip),
                  notice: 'New note created'
    else
      redirect_to trip_path(trip_id)
    end
  end
end
