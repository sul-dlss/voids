# [Unreleased]

- ...

# [3.0.0] - 2026-09-21

- **Breaking:** no longer add an `:invalid` error to the association itself when a nested form is invalid. Nested errors are copied to the parent under `association.attribute` / `association[index].attribute` keys only, matching `ActiveRecord`'s autosave association behavior, which `accepts_nested_attributes_for` implies. Callers that checked `errors[:association]` should check for the copied nested keys instead.
- Validate each nested form exactly once per parent validation, rather than two to three times.
- Make `AssociationProxy#any?` block-aware (matching Ruby collection semantics).

# [2.1.0] - 2026-09-15

- Propagate validation context to nested forms during parent validation.
- Validate nested forms even when parent validations fail, so nested errors still bubble up.
- Add `Voids::Base#empty?` with default emptiness semantics based on blank attributes.
- Add `AssociationProxy#reverse` for array-like read access without explicit `to_a` conversion.
- Add `changes_applied:` option to `Voids::Base#assign_attributes` so callers can bulk-assign attributes without resetting dirty tracking.
- Add CI/coverage/version badges to README

# [2.0.0] - 2026-09-14

- Re-released as voids gem

# [1.0.0] - 2026-01-13

- Initial release
