defmodule Publishing.Article do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @optional_fields ~w(title edit_url blog_id)a
  @required_fields ~w()a

  schema "article" do
    field(:title, :string)
    field(:edit_url, :string)

    belongs_to(:blog, Publishing.Blog, type: :binary_id)

    timestamps()
  end

  def changeset(%__MODULE__{} = struct, %{} = attrs) do
    struct
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
    |> assoc_constraint(:blog)
  end
end