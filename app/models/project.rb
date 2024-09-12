class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :project_changes, dependent: :destroy

  enum status: {
    draft: "Draft",
    planning: "In Planning",
    review: "Under Review",
    completed: "Completed",
    archived: "Archived"
  }, _prefix: true

  after_save :track_project_status_change, if: -> { saved_change_to_status? }


  private

  def track_project_status_change
    self.project_changes.create(
      field_name: 'status',
      value: status
    )
  end
end
