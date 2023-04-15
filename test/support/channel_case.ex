defmodule MyPlateSlateWeb.ChannelCase do
  use ExUnit.CaseTemplate

  using(_opts) do
    quote do
      import Phoenix.ChannelTest
      import MyPlateSlateWeb.ChannelCase

      @endpoint MyPlateSlateWeb.Endpoint
    end
  end

  setup(_tags) do
    :ok
  end
end
