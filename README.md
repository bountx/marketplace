# Marketplace (Rails 7)

A simple but complete e‑commerce marketplace built with Ruby on Rails. It includes browsing products and categories, carts, wishlists, reviews, checkout, purchase histories, and user profiles with authentication.

## Features
- **Products & Categories**: CRUD, listing, filtering
- **Cart & Checkout**: add/remove items, simple checkout flow
- **Wishlists**: save products for later
- **Reviews**: product ratings and comments
- **Purchase History**: past orders overview
- **User Accounts**: Devise-based auth and profiles

## Tech Stack
- **Ruby** 3.3.1, **Rails** 7.1.x
- Importmap + Stimulus/ES modules; minimal JS
- SQLite (dev/test); configurable via `config/database.yml`
- Puma, Action Cable, Active Storage

## Quick Start
```bash
# 1) Install dependencies
bundle install
yarn install --frozen-lockfile || true   # if Yarn is present

# 2) Setup database & seed sample data
bin/rails db:setup
bin/rails db:seed

# 3) Run server
bin/rails s
```
App runs at `http://localhost:3000`.

## Running Tests
```bash
bin/rails test
```

## Docker (optional)
```bash
docker build -t marketplace .
docker run -p 3000:3000 --env RAILS_ENV=development marketplace
```

## Project Docs
Generated API/code docs are available at `doc/index.html`.

## Configuration
- Environment: copy `.env.example` to `.env` if present; otherwise use standard Rails credentials and `config/environments/*`.
- Database: adjust `config/database.yml` as needed.

---
Made with Rails 7. Contributions and feedback are welcome.

