module UsersDatesSearchable
  def for_users(users)
    where('user_id IN (?)', users)
  end

  def in_range(start, finish)
    where(event_created_at => start..finish)
  end

  def event_created_at
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end
end
