# Git Source-Control Work-Flow

## Main branches

Every repository should contain at least the following long lived branches, all containing full project code in various stages of production readiness:

### `staging` branch

The `staging` branch is built on top of `master` and `develop` additionally containing all other feature branches that are thought to be ready for integration and testing.

This branch is build and rebuild frequently (ideally by an automated process) and reflects the untested, cutting edge state of the code base ready for testing.

Feature branches, having been merged to `staging` and having been tested, will either be pulled back for more work or be (manually) merged to the `develop` branch.

### `develop` branch

The `develop` branch is built on top of `master` additionally containing fully tested and reviewed feature branches.

Feature branches are merged to `develop` manually (ideally in a group setting, during sprint reviews or similar), only after testing and code review.

At any time `develop` is assumed to be stable and should be used as a default branching off point for any new feature branch.

### `rc` branch

When ever `develop` is feature complete and ready to be locked for a release, it is copied into a `rc` branch.

The `rc` branch is meant for to be deployed separately and be thoroughly tested before merging it to `master` and rolling out a release.

During its lifetime the `rc` branch is meant to be feature locked and only hotfixes for issues found during testing should be merged into it.

### `master` branch

The `master` branch contains production ready code, fully tested and ready to be deployed.

Code is merged to `master`:

- When making a new release, by merging and entire, stable and tested `rc` branch.
- When merging a hotfix for issues that got passed `rc` testing and got released into production.

## Feature branches

Feature branches are a self-contained, functional set of code changes meant to add functionality or fix issues in the codebase.

By default feature branches are banched off from ˙develop`, but when they are dependent on another feature branch they should be branched off from there. When a branch is dependent on another branch it is up to the branch owner to keep track of the dependency branch and keep their branch rebased on the latest state of the depeendency branch.

All feature branches should follow a naming convention for one of the following:

### Issue or Assignment branch

Branches addressing a particular assigned issue referencing a Github issue, GitLab issue, JIRA item, Azure assignment item, or similar should be named as `issue/NN-brief-issue-description` where `NN` is the id number of the issue/assignment, while the `brief-issue-description` is usually the issue title only in lowercase and using dashes for whitespace.

### HotFix branch

Branches implementing a fix for an urgent issue, meant to be fast tracked to `rc` or `master` branches, should be named as `hotfix/NN-brief-hotfix-description`, or when there is no issue to reference `hotfix/brief-hotfix-description`

### Feature branch

Branches implementing a broader feature, not contained by a single issue should be named as `feature/brief-feature-description`.
Can be used for project architecture changes, code refactors or just be aggregations of smaller, single issue branches.

## Commit messages

All commit messages should accurately describe what is being done within the commit - brevity is appreciated, but completeness and clarity are paramount.

In issue branches every commit message needs to include a reference to the issue/assignment it is related to:

`(issue #NN)` or `(issues #NN, #MM)`

where `NN` and `MM` are id numbers of issues/assignments, so that it can easily be tracked back even after merging.

> Example single line commit message:
>
> ```
> Fixed problems with miscounting votes on multiple async requests. Added tests to prevent > regression. (issue #123)
> ```
>
> Example multi line commit message:
>
> ```
> Fixed problems with miscounting votes (issues #123, #456)
> - Fixed problems with miscounting votes on multiple async requests
> - Added tests to prevent regression
> ```
