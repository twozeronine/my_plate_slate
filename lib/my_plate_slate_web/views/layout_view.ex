defmodule MyPlateSlateWeb.LayoutView do
  use MyPlateSlateWeb, :view

  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end
