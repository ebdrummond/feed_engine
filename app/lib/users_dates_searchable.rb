module UsersDatesSearchable
  def for_users(users)
    where('user_id IN (?)', users)
  end

  def in_range(start, finish)
    where(:event_created_at => start..finish)
  end
end
