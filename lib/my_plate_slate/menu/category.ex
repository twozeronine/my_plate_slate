defmodule MyPlateSlate.Menu.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :description, :string
    field :name, :string

    has_many :items, MyPlateSlate.Menu.Item

    timestamps()
  end


  def changeset(%__MODULE__{} = category, params) do
    category
    |> cast(params, [:description, :name])
    |> validate_required([:name])
  end
end
