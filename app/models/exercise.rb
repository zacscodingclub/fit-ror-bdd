class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: {min: 1, maximum: 100}
  validates :work_sets, presence: true
  validates :details, presence: true
  validates :workout_date, presence: true
end
