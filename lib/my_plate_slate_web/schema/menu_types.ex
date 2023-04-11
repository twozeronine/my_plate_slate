defmodule MyPlateSlateWeb.Schema.MenuTypes do
  use Absinthe.Schema.Notation

  alias MyPlateSlateWeb.Resolvers

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

    @desc "Added to the menu before this date"
    field :added_before, :date

    @desc "Added to the menu after this date"
    field :added_after, :date
  end

  input_object :menu_item_input do
    field :name, non_null(:string)
    field :description, :string
    field :price, non_null(:decimal)
    field :category_id, non_null(:id)
  end

  object :menu_item do
    interfaces([:search_result])
    field :id, :id
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :added_on, :date
  end

  object :category do
    interfaces([:search_result])
    field :name, :string
    field :description, :string

    field :items, list_of(:menu_item) do
      resolve(&Resolvers.Menu.items_for_category/3)
    end
  end

  object :menu_item_result do
    field :menu_item, :menu_item
    field :errors, list_of(:input_error)
  end

  interface :search_result do
    field :name, :string

    resolve_type(fn
      %MyPlateSlate.Menu.Item{}, _ ->
        :menu_item

      %MyPlateSlate.Menu.Category{}, _ ->
        :category

      _, _ ->
        nil
    end)
  end
end
