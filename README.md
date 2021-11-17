# ist-task

- Ruby 2.7.1
- Rails 6.1
- PostgreSQL

## Getting Started

To get up and running:

- Clone the repo to your local machine:

# HTTPS

git clone https://github.com/team-infinikorn/ist-task.git

# ENV Variables

  Create `.env.development.local` & `.env.test.local` file and add `SECRET_KEY_BASE` ENV variable with any secret key e.g. SecureRandom.hex(12)

# Install dependencies

  `bundle install`

# Prepare DB

  `rails db:create`
  `rails db:migrate`

# Swagger DOCS
- Visit `/api-docs/` to view swagger docs.
- run `rake rswag` to update swagger docs.

# Rspec Tests

run `rspec`

## Staging Site

- Go to `https://ist-task.herokuapp.com/api-docs/index.html` to view swagger docs on heroku staging instance.
- Note: Background jobs are not running on Heroku as they are not part of free plan.
