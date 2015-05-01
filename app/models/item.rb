class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :user, presence: true
  validates :title, length: { minimum: 5 }, presence: true

  # update list - with completed items at bottom of list
  scope :sorted, -> { order(score: :asc) }

  # Display time remaining
  def days_left
    days_active = (DateTime.now.to_date - created_at.to_date).to_i
    6 - days_active
  end

  # Calculate score for record ordering
  def calculate_score
    if self[:completed] == false
      points = 2
    else
      points = 1
    end
    total_points = points + ( time_elapsed + 2.0 )
    self.update_attributes(score: total_points)
  end

  # Check time elapsed since record created
  def time_elapsed
    if self.created_at == nil
      set_created_at_time
    end
    (Time.now - self.created_at) / 3600
  end

  # Set the created_at time for new records
  def set_created_at_time
    self.created_at = Time.now
  end

  # Mark items as complete and calculate score
  def mark_complete
    self.update_attributes(completed: true)
    calculate_score
  end
end
