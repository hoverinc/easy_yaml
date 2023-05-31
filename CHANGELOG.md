# Master

# Releases

## 0.4.0
- Fixes
  - Require Ruby >= 3.2.2
  - Rubocop updates
  - Update `BUNDLED WITH` from 2.4.6 to 2.4.13

## 0.3.0
- Fixes
  - Require Ruby >= 3.1.3
  - Rubocop updates
  - Update `BUNDLED WITH` from 2.2.17 to 2.4.6

## 0.2.3 / 2021-10-12
- Fixes
  - Unpin and version bump all gem dependencies

## 0.2.2 / 2021-06-29

- Fixes
  - [Security] Version bump rexml (CVE-2021-28965)
  - Rubocop updates

## 0.2.1 / 2020-04-10

- Fixes
  - [#3](https://github.com/hoverinc/easy_yaml/pull/3) Appease Rubocop

## 0.2.0 / 2020-04-10

- Fixes
  - [#2](https://github.com/hoverinc/easy_yaml/pull/2) Resolve paths relative to the current path, by [@jfahrer](https://github.com/jfahrer)
    > This allows the gem to be used outside of Rails. Without this change relative paths to a yaml file are expanded to the path the gem is installed in.

## 0.1.0 / 2020-02-28

- EasyYAML's Birthday!

- Features
  - Read a YAML file, evaluate ERB in it, and parse it as YAML. All in one step.
  - `EasyYAML.load path/to/file.yml`
  - Optionally disable any of the three opinionated defaults:
    - `allow_aliases: false` to not follow/expand YAML aliases
    - `allow_erb: false` to not evaluate ERB in the file
    - `relative_to_rails_root: false` to not prefix the file lookup path with `Rails.root` (useful if you're using `EasyYAML` outside of a Rails app).
