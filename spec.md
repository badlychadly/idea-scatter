# Specifications for the Sinatra Assessment

Specs:
- [x Used Sinatra::Base to define controller actions and routes in the Controllers. Also to configure my views, and set sessions which enable a user to log in.] Use Sinatra to build the app
- [x This app depends on ActiveRecord,ActiveRecord::Base, and sinatra-activerecord to relate the (mvc)'s that operate and store and render info in my db] Use ActiveRecord for storing information in a database
- [x This app has three models Category, Idea, and User.] Include more than one model class (list of model class names e.g. User, Post, Category)
- [ideas in my join table, it belongs_to users and categories. Category and User have a many_to_many relationship through ideas, and they have many ideas.] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
- [x A user must sign in to create Ideas, after signup user is logged in and info is recorded in the database] Include user accounts
- [x helper methods defined in app controller prevent a user from alter other users content. actions definded with the helpers and conditionals allow users to make changes only when the conditions are met] Ensure that users can't modify content created by other users
- [x Idea belongs to both other models and has routes for new, show, patch, and delete] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x User model uses has_secure_password to ensure password criteria is met, and also validates the presence of email and username along with email uniqueness] Include user input validations
- [x if a new category is requested to be made that is not valid post action will redirect and display a flash message hash with all of the errors from #errors.full_messages] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
