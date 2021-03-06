# url-status-check

A GitHub Action that will ping a url and output the status code and content from the response. An optional flag can be set to cause the action to fail when a status code of 400 or more is returned.

## Index

- [url-status-check](#url-status-check)
  - [Index](#index)
  - [Inputs](#inputs)
  - [Outputs](#outputs)
  - [Example](#example)
  - [Contributing](#contributing)
    - [Incrementing the Version](#incrementing-the-version)
  - [Code of Conduct](#code-of-conduct)
  - [License](#license)

## Inputs
| Parameter            | Is Required | Default | Description                                                                                                                                   |
| -------------------- | ----------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| `url`                | true        | N/A     | The url to ping.                                                                                                                              |
| `fail-on-bad-status` | false       | true    | A flag that specifies whether or not to fail the action when a 400 or higher status code is returned. The expected values are true and false. |

## Outputs
| Output        | Description                               |
| ------------- | ----------------------------------------- |
| `status_code` | The status code returned by the request.  |
| `content`     | The body content returned by the request. |

## Example

```yml
jobs:
  status-check:
    runs-on: ubuntu-20.04
    steps:
      - name: 'Get the status of google.com'
        uses: im-open/url-status-check@v1.0.0
        with:
          url: 'https://www.google.com/'
          fail-on-bad-status: false
```

## Contributing

When creating new PRs please ensure:
1. For major or minor changes, at least one of the commit messages contains the appropriate `+semver:` keywords listed under [Incrementing the Version](#incrementing-the-version).
2. The `README.md` example has been updated with the new version.  See [Incrementing the Version](#incrementing-the-version).
3. The action code does not contain sensitive information.

### Incrementing the Version

This action uses [git-version-lite] to examine commit messages to determine whether to perform a major, minor or patch increment on merge.  The following table provides the fragment that should be included in a commit message to active different increment strategies.
| Increment Type | Commit Message Fragment                     |
| -------------- | ------------------------------------------- |
| major          | +semver:breaking                            |
| major          | +semver:major                               |
| minor          | +semver:feature                             |
| minor          | +semver:minor                               |
| patch          | *default increment type, no comment needed* |

## Code of Conduct

This project has adopted the [im-open's Code of Conduct](https://github.com/im-open/.github/blob/master/CODE_OF_CONDUCT.md).

## License

Copyright &copy; 2021, Extend Health, LLC. Code released under the [MIT license](LICENSE).

[git-version-lite]: https://github.com/im-open/git-version-lite