# react-crystal

Render React components in crystal with [react-stdio](https://github.com/mjackson/react-stdio).

**Caution** - probs not ready for highly-performant or mission-critical applications. A node process is spun up for each render so you're at the whim of node's startup time.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  react-crystal:
    github: aarongodin/react-crystal
```

## Usage

*Better docs incoming, still a WIP*

```crystal
require "react-crystal"
```

### Render

Render methods accept a `PropsHash` type which is an alias:

```cr
alias PropsHash = Hash(String, JSON::Type)
```
#### render_to_string

```cr
React.render_to_string(path : String, props : PropsHash) : String
```

#### render_to_static_markup

```cr
React.render_to_static_markup(path : String, props : PropsHash) : String
```

Paths can be either an absolute path or relative to cwd.

### Components

Components must follow the same guidelines as [react-stdio](https://github.com/mjackson/react-stdio), in that they must use the commonjs2 module definition to export (`module.exports = (props) => {}`).

If you're using any non-node features of ECMAScript, such as static imports/exports, you'll need to transpile and reference the transpiled version that uses the commonjs2 format.

### Config

Class-instance variables on the `React` module can be used to modify how render methods behave.

#### component_directory

When set, components will be loaded relative to `component_directory`.

```cr
React.component_directory = File.expand_path("src/application/assets/javascript")

React.render_to_string "containers/Application" # path is relative to component_directory
```

#### react_stdio_executable

*react-crystal* tries to use a globally installed version of `react-stdio` as its default. To specify a different executable, set `react_stdio_executable`. For example, referencing the locally-installed version to your project:

```cr
React.react_stdio_executable = File.expand_path("node_modules/.bin/react-stdio")
```

## Development

*todo*

## Contributing

1. Fork it ( https://github.com/aarongodin/react-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [aarongodin](https://github.com/aarongodin) - creator, maintainer
