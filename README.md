# homebrew-tap

Homebrew formulae of yama6a tools.

## Install

```sh
brew install yama6a/tap/stbox
```

`brew upgrade stbox` updates it.

| Formula | Tool |
|:--- |:--- |
| `stbox` | [subtitle-toolbox-go](https://github.com/yama6a/subtitle-toolbox-go): read, edit and write subtitle files |

The release workflow of each tool writes its formula. Do not edit a formula by hand.

## How a release reaches the tap

1. The release workflow of the tool pushes the new formula to a branch named `bottle/stbox-<version>`.
2. The `bottle` workflow builds a bottle on each platform: macOS arm64 (macOS 14 and later), macOS Intel, Linux x86_64 and Linux arm64.
3. It publishes the bottles as the release `stbox-<version>` of this repository.
4. It commits the formula with its bottle block to `main` and deletes the branch.
5. It installs the formula from `main` on each platform and checks that Homebrew pours a bottle.

A formula without a bottle block makes Homebrew check for a current Xcode before the install, and the install fails on an old Xcode. The bottle avoids that check.

The `test` workflow audits, installs and tests the formula on each pull request and each push to `main`.
