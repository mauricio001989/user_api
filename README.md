# USER_API

![Ruby](https://img.shields.io/badge/ruby-3.2.2-red)
![Rails](https://img.shields.io/badge/rails-8.0.2-green)
![CI](https://github.com/mauricio001989/user_api/actions/workflows/ci.yml/badge.svg?branch=main)
![RSpec](https://img.shields.io/badge/tests-passing-brightgreen)
[![Coverage Status](https://codecov.io/gh/mauricio001989/user_api/branch/main/graph/badge.svg)](https://codecov.io/gh/mauricio001989/user_api)

----
# User API

API project built with Ruby on Rails.

---

## 🚀 Setup

Clone the repository (public access via SSH):

```
git clone git@github.com:mauricio001989/user_api.git
cd user_api
```

Run the setup script (this prepares everything for development):
```
  bin/setup
```

- What `bin/setup` does:  
  - Dependencies  
    - Runs `bundle install` to install all Ruby gems.
  - Environment configuration  
    - Copies `.env.example` into `.env` (only if .env does not already exist).  
  - Git hooks installation (only in non-production environments)  
    - Installs `pre-commit` and `pre-push` hooks from `scripts/`.  
      - `pre-commit`: runs **Rubocop** (linting).  
      - `pre-push`: runs **Brakeman** (security scan) and **RSpec tests**  
        - Fails if **N+1 queries** are detected.  
        - Fails if **test coverage is below 98%** (SimpleCov + Codecov).  
  - Database setup  
    - `Creates all required databases`:  
      - Main project DB  
      - Queue migrations DB  
    - `Runs migrations`.  
    - `Seeds` include an initial admin user and default roles.
  - Cleanup
    - `Clears old logs` and `temporary files`.  
  - Server  
    - Restarts the Rails application server.  
- Optionally, if you run `bin/setup --rails-s`, it will start the development server (bin/dev).  

## 🛠️ After setup

Start the service manually
```
bin/dev
```

Start the background jobs processor
```
bin/jobs
```  

### 📧 Email confirmation in development  
The project uses the gem [`letter_opener`](https://github.com/ryanb/letter_opener) so that emails are **not actually sent** while in `development`.  
Instead, when you create a new user with an email, the confirmation screen will automatically open in the browser.  

If you need to **send real emails in development**, set `SMTP_USERNAME` and `SMTP_PASSWORD` in your `.env` variables.  
The Rails config in `config/environments/development.rb` is prepared to switch from `letter_opener` to `:smtp` when those variables are present.

----

## 🔄 Continuous Integration

This project includes a GitHub Actions CI pipeline that runs automatically on pushes and pull requests to `main`.  

Workflow file: [CI pipeline](.github/workflows/ci.yml) — or view the latest coverage online: [Codecov report](https://codecov.io/gh/mauricio001989/user_api)

Jobs:
- `SECURITY SCAN`  
  → Runs Brakeman for static security analysis in Rails.
- `LINT`  
  → Runs RuboCop for code style consistency.
- `SPEC`  
  → Runs the RSpec test suite with a PostgreSQL database.  
  → Detects N+1 queries (pipeline fails if found).  
  → Generates coverage with SimpleCov and uploads it to Codecov.  
    - To view coverage locally: `bundle exec rspec && open coverage/index.html`  
    - Coverage threshold: pipeline fails if coverage is **< 98%**.

### ✅ Additional rules
- **Bump version**  
  → A bump PR is generated from `development` using `bin/bump`.  
  → When the bump PR is merged into `development`, a workflow syncs `development` into `main`.  
  → The bump bundles all PRs already merged into `development` during that cycle (single gate to `main`).


### 🌿 Branch flow
                                                    (Merge PRS #1,2)
                                                           ↕
    o-o----------------------------------------------------o------------------ Main
    ↓  ↘                                                   ↑
    ↓    o---o------------------o---o--o---o---------------o--o--------------- Development
    ↓     \   \                /   /    \   \             /  /
    ↓      \   o--(PR #1)----o-   /      \    o--(bump)--o  /
    ↓       \                |   /        \                /
    ↓        o--(PR #2)--o---┼--           o--(PR #3)--o--
    ↓                    ↓   ↓                         ↓
    o--------------------o---o-------------------------o--------------------- QA

- All new features start from `development` → create a new feature branch.  
- Feature branches are merged into `qa` (test environment).  
- In `qa`, features wait for approval/OK; only then are they merged back into `development`.  
- A bump PR is created from `development`; merging it triggers the workflow that syncs into `main`.

⚠️ If necessary, `qa` can be reset from `main`.  
⚠️ `development` can also act as a second test environment, depending on the project’s needs.

------
This project is created by Mauricio Vasquez [linkedin](https://www.linkedin.com/in/mauricio-1989/)
