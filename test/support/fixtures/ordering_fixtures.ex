defmodule MyPlateSlate.OrderingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyPlateSlate.Ordering` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        customer_number: 42,
        items: %{},
        ordered_at: ~U[2023-04-10 04:56:00Z],
        state: "some state"
      })
      |> MyPlateSlate.Ordering.create_order()

    order
  end
end
