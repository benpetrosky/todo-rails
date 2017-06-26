class Task < ActiveRecord::Base
  belongs_to :list
  before_create(:assign_done_to_false)
  validates :description, :presence => true

private
  def assign_done_to_false
    self.done_tasks = false
  end
end
