# EO+ ANTLR4 Grammar (EOSERV)

[![test](https://github.com/Cirras/eoplus-antlr4/actions/workflows/test.yml/badge.svg?event=push&branch=eoserv)](https://github.com/Cirras/eoplus-antlr4/actions/workflows/test.yml)

An ANTLR4 grammar for the EO+ quest scripting language from Endless Online.

This branch covers the EOSERV flavor of the EO+ syntax.

## Branches

- `master`: The official EO+ syntax
- `eoserv`: The [EOSERV](https://eoserv.net) flavor of the EO+ syntax

## Syntax support

The following syntax structures are supported:

- `main` block
  - `questname` attribute
  - `version` attribute
- `state` block
  - `desc` statement
  - `action` statement
  - `rule` statement
- Expressions
  - String literals
  - Integer literals
- Identifiers
  - of the form `[_a-zA-Z][_a-zA-Z0-9]*`

### Differences

While simple, the official "grammar" isn't especially well-defined.
The quest parser in the official game server was very lenient, and would accept all sorts of
malformed inputs.

This grammar disallows:

- Strings that are not properly terminated
- Argument lists that are not properly closed
- Omission of the keywords `action` or `rule`
- Mislabeled `action` and `rule` statements
- Use of dashes within identifier names

### Examples

- See the [examples](examples) directory for test data files.
- See the [eo-quests](https://github.com/Cirras/eo-quests) repo for the official quest files.

## License

Licensed under the [MIT](LICENSE) license.