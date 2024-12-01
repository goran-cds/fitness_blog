defmodule FitnessBlog.ChangesetUtil do
  import Ecto.Changeset

  def validate_when_field_not_nil(changeset, field_name, fun) do
    case get_field(changeset, field_name) do
      nil -> changeset
      _ -> fun.(changeset)
    end
  end

  def validate_required_fields(changeset, module, fields, keywords \\ []) do
    Enum.reduce_while(
      fields,
      changeset
      |> validate_required(fields),
      fn field, current_changeset ->
        if current_changeset.valid?,
          do: {:cont, apply(module, :validate_field, [current_changeset, field, keywords])},
          else: {:halt, current_changeset}
      end
    )
  end

  def validate_optional_fields(changeset, module, fields, opts \\ []) do
    Enum.reduce_while(
      fields,
      changeset,
      fn field, current_changeset ->
        future_changeset =
          current_changeset
          |> validate_when_field_not_nil(field, fn the_changeset ->
            apply(module, :validate_field, [the_changeset, field, opts])
          end)

        if future_changeset.valid?,
          do: {:cont, future_changeset},
          else: {:halt, future_changeset}
      end
    )
  end

  def validate_required_and_optional_fields(
        changeset,
        module,
        required_fields,
        optional_fields,
        opts \\ []
      ) do
    changeset
    |> validate_required_fields(module, required_fields, opts)
    |> validate_optional_fields(module, optional_fields, opts)
  end
end
