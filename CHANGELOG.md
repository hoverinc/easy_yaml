# Master

## 0.1.0 / 2020-02-28

- EasyYAML's Birthday!

- Features
  - Read a YAML file, evaluate ERB in it, and parse it as YAML. All in one step.
  - `EasyYAML.load path/to/file.yml`
  - Optionally disable any of the three opinionated defaults:
    - `allow_aliases: false` to not follow/expand YAML aliases
    - `allow_erb: false` to not evaluate ERB in the file
    - `relative_to_rails_root: false` to not prefix the file lookup path with `Rails.root` (useful if you're using `EasyYAML` outside of a Rails app).
