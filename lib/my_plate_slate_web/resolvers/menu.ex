defmodule MyPlateSlateWeb.Resolvers.Menu do
  alias MyPlateSlate.Menu

  def menu_items(_, args, _) do
    {:ok, Menu.list_items(args)}
  end
end
