defmodule MyPlateSlateWeb do
  def controller() do
    quote do
      use Phoenix.Controller, namespace: MyPlateSlateWeb

      import Plug.Conn
      import MyPlateSlateWeb.Gettext
      alias MyPlateSlateWeb.Router.Helpers, as: Routes
    end
  end

  def view() do
    quote do
      use Phoenix.View,
        root: "lib/my_plate_slate_web/templates",
        namespace: MyPlateSlateWeb

      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      unquote(view_helpers())
    end
  end

  def live_view() do
    quote do
      use Phoenix.LiveView,
        layout: {MyPlateSlateWeb.LayoutView, "live.html"}

      unquote(view_helpers())
    end
  end

  def live_component() do
    quote do
      use Phoenix.LiveComponent

      unquote(view_helpers())
    end
  end

  def component() do
    quote do
      use Phoenix.Component

      unquote(view_helpers())
    end
  end

  def router() do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  def channel() do
    quote do
      use Phoenix.Channel
      import MyPlateSlateWeb.Gettext
    end
  end

  defp view_helpers() do
    quote do
      use Phoenix.HTML

      import Phoenix.LiveView.Helpers

      import Phoenix.View

      import MyPlateSlateWeb.ErrorHelpers
      import MyPlateSlateWeb.Gettext
      alias MyPlateSlateWeb.Router.Helpers, as: Routes
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
