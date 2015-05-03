class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :user, presence: true
  validates :title, length: { minimum: 5 }, presence: true

  # Scope complete and incomplete items
  scope :incomplete_items, -> { where(completed: false) }
  scope :completed_items, -> { where(completed: true) }

  # Order items in list by created_at or updated_at
  scope :incomplete_and_ordered, -> { incomplete_items.order("created_at DESC") }
  scope :completed_and_ordered, -> { completed_items.order("updated_at DESC") }

  # Display time remaining
  def days_left
    days_active = (DateTime.now.to_date - created_at.to_date).to_i
    6 - days_active
  end

  # Set the created_at time for new records
  def set_created_at_time
    self.created_at = Time.now
  end

  # Mark items as complete
  def mark_complete
    self.update_attributes(completed: true)
  end
end
