# 🤝 Contribution Guide - R-Type Project

Welcome to the R-Type contribution guide. This document defines our organization, our roles and our technical standards. Our goal is to keep the `main` branch always deployable, while keeping the work smooth for the whole team.

## 📋 Project Management (GitHub Projects)

We use GitHub Projects to track tasks. Every **Issue** must include the following:

1. **Clear title:** precisely describes the goal of the task.
2. **Description:** the context and the acceptance criteria.
3. **Priority:** the urgency of the task.
4. **Ranking (MoSCoW):**
   - *Must* (required for the core features)
   - *Should* (important, but can be worked around for a while)
   - *Could* (bonus / polish)
5. **PR link (mandatory):** as soon as a Pull Request is opened for this issue, it must be linked to it (with the `Closes #issue_number` keyword).

---

## 🌿 Branching Strategy

* All development happens on **short-lived branches**.
* The branch name must reflect the feature or the fix (e.g. `feat/server/broadcast` or `fix/gui/animations`).
* Once the work is done, the branch is merged into `main` through a Pull Request.
* **Golden rule:** the `main` branch must always be stable and deployable.

---

## 🛠️ Tooling and Local Hooks

We use Git hooks to make sure only clean and well-formatted code gets committed.

**Mandatory after cloning the repository:**
Make sure to set up and install the dependencies of your local environment to enable the automatic checks on commit.

**Automatic formatting (pre-commit):**
* **C++:** the code is formatted automatically.

**Commit conventions:**
We follow the Angular/Airbnb style conventions for the structure of our commit messages. A hook checks the syntax on every commit.
*Expected format:* `<type>(<scope>): <description>` (e.g. `feat(ai): add the decision tree`).

---

## 🔍 Code Review Process (Pull Requests)

To merge code into `main`, the following rules strictly apply:

* **Only 1 approval required:** the review must be done by at least one other team member.
* **No self-approval:** approving your own PR is strictly forbidden.
* **Delay:** a requested review must be handled within **48 hours** so the team is not blocked.

**What the reviewer must check:**
1. **Compilation:** does the code build locally without errors or major warnings?
2. **Architecture:** does the logic respect the separation of concerns?
3. **Code quality:** is the code clean, readable, well named and understandable without excessive effort?

---

## 🚀 Continuous Integration and Deployment (CI/CD)

Our CI pipeline (GitHub Actions) is meant to evolve throughout the project:

* **Currently:**
  * Automatic mirror (push to the official delivery repository).
* **Next steps:**
  * Strict build check (`cmake`).
  * Unit tests run.
