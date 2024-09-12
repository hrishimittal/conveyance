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
end
