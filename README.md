# Jungle

A mini e-commerce application built with Rails 4.2. Existing code was provided with bugs that needed to be fixed, as well as new features that were to be implemented.

The focus of this project was to become familiar with Ruby and Ruby on Rails framework.

## Project Stack

**Front-End**: HTML, SASS  
**Back-End**: Ruby on Rails, SQLite  
**Testing**: RSpec, Capybara, Poltergeist, PhantomJS

## Project Features

- User authentication with bcrypt gem
- Admin authentication to access certain admin functionality
- Sold out badge for users to know item is not available
- Enhancements throughout the app for better UX/UI

## Final Product

**User experience**

!["Gif of user experience"](https://github.com/angel-sinn/LHL_jungle-app/blob/master/docs/jungle-app-purchase.gif)

**Admin experience**

!["Gif of admin experience"](https://github.com/angel-sinn/LHL_jungle-app/blob/master/docs/jungle-app-admin.gif)

## Getting Started

1. Run `bundle install` to install dependencies

2. Create `config/database.yml` by copying `config/database.example.yml`

3. Create `config/secrets.yml` by copying `config/secrets.example.yml`

4. Run `bin/rake db:reset` to create, load and seed db

5. Create `.env` file based on `.env.example`

6. Sign up for a Stripe account

7. Put Stripe (test) keys into appropriate .env vars

8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
