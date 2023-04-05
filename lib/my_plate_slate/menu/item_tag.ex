defmodule MyPlateSlate.Menu.ItemTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_tags" do
    field :description
    field :name, :string

    many_to_many :items, MyPlateSlate.Menu.Item, join_through: "items_taggings"

    timestamps()
  end

  def changeset(%__MODULE__{} = item_tag, params) do
    item_tag
    |> cast(params, [:name, :description])
    |> validate_required([:name])
  end
end
