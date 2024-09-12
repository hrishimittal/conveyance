require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'status changes' do
    let(:project) { Project.create(name: "New Project", status: Project.statuses.keys.first) }

    it 'can change to valid statuses' do
      Project.statuses.keys.each do |status|
        expect(project.update(status: status)).to be true
        expect(project.reload.status).to eq status
      end
    end

    it 'cannot change to invalid status' do
      expect { project.update!(status: 'Invalid Status') }.to raise_error(ArgumentError)
      expect(project.reload.status).to eq Project.statuses.keys.first
    end
  end

  describe '#track_project_status_change' do
    let!(:project) { Project.create(name: "New Project", status: :draft) }

    it 'creates a project_change record when status changes' do
      expect {
        project.update(status: :planning)
      }.to change(ProjectChange, :count).by(1)
    end

    it 'sets correct attributes on the project_change record' do
      project.update(status: 'review')
      change = project.project_changes.last

      expect(change.field_name).to eq('status')
      expect(change.value).to eq('review')
    end

    it 'does not create a project_change record when status does not change' do
      expect {
        project.update(name: 'New Name')
      }.not_to change(ProjectChange, :count)
    end
  end
end
