require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'adding a comment on a project' do
    let(:project) { Project.create(name: 'Test Project') }
    let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
    let(:comment) { Comment.new(body: 'Test comment', project: project, user: user) }

    it 'saves the comment' do
      expect { comment.save }.to change(Comment, :count).by(1)
    end
  end
end
