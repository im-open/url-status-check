# url-status-check

A GitHub Action that will ping a url and output the status code and content from the response. An optional flag can be set to cause the action to fail when a status code of 400 or more is returned.

## Index <!-- omit in toc -->

- [url-status-check](#url-status-check)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
  - [Usage Examples](#usage-examples)
  - [Contributing](#contributing)
    - [Incrementing the Version](#incrementing-the-version)
    - [Source Code Changes](#source-code-changes)
    - [Updating the README.md](#updating-the-readmemd)
  - [Code of Conduct](#code-of-conduct)
  - [License](#license)

## Inputs

| Parameter            | Is Required | Default | Description                                                                                                                                   |
|----------------------|-------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| `url`                | true        | N/A     | The url to ping.                                                                                                                              |
| `fail-on-bad-status` | false       | true    | A flag that specifies whether or not to fail the action when a 400 or higher status code is returned. The expected values are true and false. |

## Outputs

| Output        | Description                               |
|---------------|-------------------------------------------|
| `status_code` | The status code returned by the request.  |
| `content`     | The body content returned by the request. |

## Usage Examples

```yml
jobs:
  status-check:
    runs-on: ubuntu-20.04
    steps:
      - name: 'Get the status of google.com'
        uses: im-open/url-status-check@v1.1.1
        with:
          url: 'https://www.google.com/'
          fail-on-bad-status: false
```

## Contributing

When creating PRs, please review the following guidelines:

- [ ] The action code does not contain sensitive information.
- [ ] At least one of the commit messages contains the appropriate `+semver:` keywords listed under [Incrementing the Version] for major and minor increments.
- [ ] The README.md has been updated with the latest version of the action.  See [Updating the README.md] for details.

### Incrementing the Version

This repo uses [git-version-lite] in its workflows to examine commit messages to determine whether to perform a major, minor or patch increment on merge if [source code] changes have been made.  The following table provides the fragment that should be included in a commit message to active different increment strategies.

| Increment Type | Commit Message Fragment                     |
|----------------|---------------------------------------------|
| major          | +semver:breaking                            |
| major          | +semver:major                               |
| minor          | +semver:feature                             |
| minor          | +semver:minor                               |
| patch          | *default increment type, no comment needed* |

### Source Code Changes

The files and directories that are considered source code are listed in the `files-with-code` and `dirs-with-code` arguments in both the [build-and-review-pr] and [increment-version-on-merge] workflows.  

If a PR contains source code changes, the README.md should be updated with the latest action version.  The [build-and-review-pr] workflow will ensure these steps are performed when they are required.  The workflow will provide instructions for completing these steps if the PR Author does not initially complete them.

If a PR consists solely of non-source code changes like changes to the `README.md` or workflows under `./.github/workflows`, version updates do not need to be performed.

### Updating the README.md

If changes are made to the action's [source code], the [usage examples] section of this file should be updated with the next version of the action.  Each instance of this action should be updated.  This helps users know what the latest tag is without having to navigate to the Tags page of the repository.  See [Incrementing the Version] for details on how to determine what the next version will be or consult the first workflow run for the PR which will also calculate the next version.

## Code of Conduct

This project has adopted the [im-open's Code of Conduct](https://github.com/im-open/.github/blob/main/CODE_OF_CONDUCT.md).

## License

Copyright &copy; 2023, Extend Health, LLC. Code released under the [MIT license](LICENSE).

<!-- Links -->
[Incrementing the Version]: #incrementing-the-version
[Updating the README.md]: #updating-the-readmemd
[source code]: #source-code-changes
[usage examples]: #usage-examples
[build-and-review-pr]: ./.github/workflows/build-and-review-pr.yml
[increment-version-on-merge]: ./.github/workflows/increment-version-on-merge.yml
[git-version-lite]: https://github.com/im-open/git-version-lite
