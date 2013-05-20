class Trip < ActiveRecord::Base
  attr_accessible :name,
                  :destination,
                  :start,
                  :end,
                  :visible

  belongs_to :owner, :foreign_key => 'user_id', :class_name => 'User'
  has_many :notes

  validate :end_date_cannot_be_earlier_than_start_date

  validates :name, :presence => true
  validates :destination, :presence => true
  validates :start, :presence => true
  validates :end, :presence => true
  validates :owner, :presence => true

  def end_date_cannot_be_earlier_than_start_date
    if self.end.present? && self.start.present? && self.end < self.start
      errors.add(:end, "can't be earlier than start")
    end
  end

  def travelers
    @travelers ||= [1, 2]
  end
end
