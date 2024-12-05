defmodule FitnessBlogWeb.Contact.FormData do
  use FitnessBlog, :schema

  import Ecto.Changeset

  @email_regex ~r/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  embedded_schema do
    field :name, :string
    field :email, :string
    field :class, :string
    field :comment, :string
  end

  def init_changeset(schema, attrs \\ %{}) do
    schema
    |> cast(attrs, [:name, :email, :class, :comment])
  end

  def changeset(schema, attrs \\ %{}) do
    schema
    |> cast(attrs, [:name, :email, :class, :comment])
    |> validate_required([:name, :email])
    |> validate_length(:name, min: 2, message: "too short")
    |> validate_length(:name, max: 50, message: "too long")
    |> validate_format(:email, @email_regex, message: "invalid email format")
  end
end
