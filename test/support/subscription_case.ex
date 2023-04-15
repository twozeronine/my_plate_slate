defmodule MyPlateSlateWeb.SubscriptionCase do
  @moduledoc """
  This module defines the test case to be used by
  subscription tests
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with channels
      use MyPlateSlateWeb.ChannelCase
      use Absinthe.Phoenix.SubscriptionTest, schema: MyPlateSlateWeb.Schema

      setup do
        MyPlateSlate.Seeds.run()

        {:ok, socket} = Phoenix.ChannelTest.connect(MyPlateSlateWeb.UserSocket, %{})
        {:ok, socket} = Absinthe.Phoenix.SubscriptionTest.join_absinthe(socket)

        {:ok, socket: socket}
      end

      import unquote(__MODULE__), only: [menu_item: 1]
    end
  end

  # handy function for grabbing a fixture
  def menu_item(name) do
    MyPlateSlate.Repo.get_by!(MyPlateSlate.Menu.Item, name: name)
  end
end
