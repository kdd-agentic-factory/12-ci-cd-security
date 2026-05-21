# Branch Protection

## Policy

Branch protection rules are defined in `workflows/policies/branch-protection.yaml`.

## Main Branch

| Rule                      | Value  |
|---------------------------|--------|
| Require pull request      | yes    |
| Required approving reviews| 1      |
| Dismiss stale reviews     | yes    |
| Require status checks     | yes    |
| Allow force pushes        | no     |
| Allow deletions           | no     |

## Release Branches (`release/*`)

| Rule                      | Value  |
|---------------------------|--------|
| Require pull request      | yes    |
| Required approving reviews| 2      |
| Require status checks     | yes    |
| Allow force pushes        | no     |
| Allow deletions           | no     |

## How to Apply

Branch protection rules must be configured in GitHub repository settings.
The `workflows/policies/branch-protection.yaml` file documents the expected
configuration and serves as the authoritative reference.

In a future automation phase, these rules will be applied programmatically
using the GitHub API or `gh` CLI.

## Exceptions

No exceptions are allowed on `main` or `release/*` without governance approval.
