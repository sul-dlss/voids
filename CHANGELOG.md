## [Unreleased]

- Add `changes_applied:` option to `Voids::Base#assign_attributes` so callers can bulk-assign attributes without resetting dirty tracking.
- Propagate validation context to nested forms during parent validation.
- Validate nested forms even when parent validations fail, so nested errors still bubble up.
- Add `Voids::Base#empty?` with default emptiness semantics based on blank attributes.
- Make `AssociationProxy#any?` block-aware (matching Ruby collection semantics).
- Add `AssociationProxy#reverse` for array-like read access without explicit `to_a` conversion.

## [1.0.0] - 2026-01-13

- Initial release
