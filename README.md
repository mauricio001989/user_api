# USER_API

![Ruby](https://img.shields.io/badge/ruby-3.2.2-red)
![Rails](https://img.shields.io/badge/rails-8.0.2-green)
![CI](https://github.com/mauricio001989/user_api/actions/workflows/ci.yml/badge.svg?branch=main)
![RSpec](https://img.shields.io/badge/tests-passing-brightgreen)
[![Coverage Status](https://codecov.io/gh/mauricio001989/user_api/branch/main/graph/badge.svg)](https://codecov.io/gh/mauricio001989/user_api)

----

## 🔄 Continuous Integration

This project includes a GitHub Actions CI pipeline that runs automatically on pushes and pull requests to `main`.  

Workflow file: [CI pipeline](.github/workflows/ci.yml) — or view the latest coverage online: [Codecov report](https://codecov.io/gh/mauricio001989/user_api)

```
Jobs:
  - Security Scan: Runs Brakeman for static security analysis in Rails.
  - Lint: Runs RuboCop for code style consistency.
  - Spec: Runs the RSpec test suite with a PostgreSQL database,  
    → generates the coverage report using SimpleCov and uploads it to Codecov.  
    → To view coverage locally: `bundle exec rspec && open coverage/index.html`  
```

------
This project is created by Mauricio Vasquez [linkedin](https://www.linkedin.com/in/mauricio-1989/)
