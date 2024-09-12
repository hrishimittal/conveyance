require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'status changes' do
    let(:project) { Project.create(status: Project.statuses.keys.first) }

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
end
