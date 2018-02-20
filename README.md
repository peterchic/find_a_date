Find-A-Date

![Find A Date Demo](/app/assets/images/findadate.gif)


This site is a pure Ruby on Rails application. It deals with simple authorization using b-crypt and sessions to store user login information.
The site is an attempt to understand and implement the various match-making algorithms dating sites use when users sign up. This app allows a user to log in/sign and find a match based off common interests, gender and sexual orientation. There is also a messaging system that allows users to message one another if they are identified as a match. Users have an inbox and outbox, and are able to delete messages as well as see if they are any unread messages in their mailbox.

## Setup for development

1. Clone the repo
2. Make sure you have Postgres running locally, for example, using [Postgres.app](https://postgresapp.com/)
3. Setup the Rails app:
    - `bundle install`
    - `bundle exec rails db:setup`
    - `bundle exec rails s`


Browse to <http://localhost:3000> to view the app
