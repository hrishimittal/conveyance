developer = User.create!(name: 'Developer', email: 'dev@example.com', password: 'password123')
designer = User.create!(name: 'Designer', email: 'design@example.com', password: 'password123')
product_manager = User.create!(name: 'Product Manager', email: 'pm@example.com', password: 'password123')
cto = User.create!(name: 'CTO', email: 'cto@example.com', password: 'password123')
ceo = User.create!(name: 'CEO', email: 'ceo@example.com', password: 'password123')

project = Project.create!(
  name: 'The Red House',
  status: :draft
)

Comment.create!(
  user: developer,
  body: "What are the possible statuses a project can have?",
  project: project
)

Comment.create!(
  user: product_manager,
  body: "The statuses are: draft, planning, review, completed, and archived.",
  project: project
)

project.update(status: :planning)

Comment.create!(
  user: developer,
  body: "Should we show the time when comments and status changes were made?",
  project: project
)

Comment.create!(
  user: designer,
  body: "Yes, we should display the date and timestamp for both.",
  project: project
)

Comment.create!(
  user: developer,
  body: "Are all users allowed to both comment and change the status, or are permissions different for each action?",
  project: project
)

Comment.create!(
  user: cto,
  body: "All users can comment and change the status.",
  project: project
)

Comment.create!(
  user: developer,
  body: "Do we have UI designs for this feature already?",
  project: project
)

Comment.create!(
  user: ceo,
  body: "The designer is busy on another project. For now, follow our design style guide. We can revisit the design later before launch.",
  project: project
)

Comment.create!(
  user: developer,
  body: "Do you want to record who changed a project's status?",
  project: project
)

Comment.create!(
  user: product_manager,
  body: "No, for now, we don't need that.",
  project: project
)

Comment.create!(
  user: developer,
  body: "Should the conversation history be displayed in reverse chronological order or forward?",
  project: project
)

Comment.create!(
  user: designer,
  body: "Reverse order, please.",
  project: project
)

Comment.create!(
  user: developer,
  body: "Should the history of comments and statuses be mixed or separate?",
  project: project
)

Comment.create!(
  user: cto,
  body: "Mixed.",
  project: project
)

Comment.create!(
  user: developer,
  body: "Ok, I have deployed a version to staging. Please review.",
  project: project
)

project.update(status: :review)

Comment.create!(
  user: cto,
  body: "Looks good.",
  project: project
)

project.update(status: :completed)
