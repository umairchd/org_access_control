This is a Ruby on Rails demo project:

Organization-Based Access Control
  Each organization has 3 roles, admins are able to do everything. others are able to view but cannot change.
Age-Based Participation Rules
  Blogs created with age based restriction, child, adult and everyone.
Custom Authentication (Devise)
Role-Based Permissions (Pundit)
Parental Consent Workflow
  If you are underage, less than 13. Than you would be shown a consent form.
Baisc Analytics via Chartkick

---

Tech Stack

Rails 7.1
PostgreSQL
Devise (Authentication)
Pundit (Authorization)
Tailwind CSS
Chartkick + Groupdate (Analytics)

---

Setup Instructions


git clone https://github.com/umairchd/org-access-control.git
cd org-access-control

# install ruby 3.2.0 (https://www.ruby-lang.org/en/documentation/installation/#apt)
bundle install

# setup username/password in database.yml
rails db:create db:migrate db:seed
rails assets:precompile

# Start the server
bin/dev

# access the server on localhost:3001