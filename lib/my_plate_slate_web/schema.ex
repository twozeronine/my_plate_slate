defmodule MyPlateSlateWeb.Schema do
  use Absinthe.Schema

  alias MyPlateSlateWeb.Resolvers

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  @desc "The list of available items on the menu"
  query do
    field :menu_items, list_of(:menu_item) do
      arg(:filter, :menu_item_filter)
      arg(:order, type: :sort_order, default_value: :asc)
      resolve(&Resolvers.Menu.menu_items/3)
    end
  end

  object :menu_item do
    field :id, :id
    field :name, :string
    field :description, :string
  end

  @desc "Filtering options for the menu item list"
  input_object :menu_item_filter do
    @desc "Matching a name"
    field :name, :string

    @desc "Matching a category name"
    field :category, :string

    @desc "Matching a tag"
    field :tag, :string

    @desc "Priced above a value"
    field :priced_above, :float

    @desc "Priced below a value"
    field :priced_below, :float
  end
end
