defmodule MyPlateSlateWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: MyPlateSlateWeb.Schema

  def id(socket), do: "users_socket:#{socket.assigns.user_id}"
end
