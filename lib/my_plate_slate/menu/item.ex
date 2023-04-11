defmodule MyPlateSlate.Menu.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :added_on, :date
    field :description, :string
    field :name, :string
    field :price, :decimal

    belongs_to :category, MyPlateSlate.Menu.Category

    many_to_many :tags, MyPlateSlate.Menu.ItemTag, join_through: "items_taggings"

    timestamps()
  end

  def changeset(%__MODULE__{} = item, params) do
    item
    |> cast(params, [:name, :description, :price, :added_on])
    |> validate_required([:name, :price])
    |> foreign_key_constraint(:category)
    |> unique_constraint(:name)
  end
end
