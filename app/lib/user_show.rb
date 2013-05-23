class UserShow
  attr_reader :current,
              :upcoming,
              :past,
              :profile_user,
              :current_user

  def initialize(params)
    @profile_user = params[:profile_user]
    @current_user = params[:current_user]

    current
    upcoming
    past
  end

  def trips
    @trips ||= if personal
      profile_user.travelings
    else
      profile_user.travelings.select { |trip| trip.user_authorized_to_view?(current_user) }
    end
  end

  def current
    @current ||= trips.select { |trip| (trip.start..trip.end).cover?(Date.today) }
  end

  def upcoming
    @upcoming ||= trips.select{|trip| trip.start > Date.today}
  end

  def past
    @past ||= trips.select{|trip| trip.start < Date.today}
  end

  private

  def personal
    current_user == profile_user
  end
end
