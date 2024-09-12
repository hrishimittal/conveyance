class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :project_changes, dependent: :destroy
end
