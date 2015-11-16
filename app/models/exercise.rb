class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: {min: 1, maximum: 100}
  validates :work_sets, presence: true
  validates :details, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true

  attr_reader :top_set

  default_scope { where('workout_date > ?', 7.days.ago).order(created_at: :desc) }

  def top_set
    return work_sets.split("x")[2]
  end
end
