class NotesController < ApplicationController
  before_filter :require_login
  before_filter :find_trip

  def create
    note = @trip.notes.build(params[:note])
    note.user = current_user

    if note.save
      redirect_to trip_path(@trip), :notice => 'New note created'
    else
      redirect_to trip_path(@trip), :error => 'Note creation failed'
    end
  end

  def destroy
    note = @trip.notes.find(params[:id])
    note.destroy
    redirect_to trip_path(@trip), :notice => "Note deleted"
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end
end
