defmodule MyPlateSlate.OrderingTest do
  use MyPlateSlate.DataCase, async: true

  alias MyPlateSlate.Ordering

  setup do
    MyPlateSlate.Seeds.run()
  end

  describe "orders" do
    alias MyPlateSlate.Ordering.Order

    test "create_order/1 with valid data creates a order" do
      chai = Repo.get_by!(MyPlateSlate.Menu.Item, name: "Masala Chai")
      fries = Repo.get_by!(MyPlateSlate.Menu.Item, name: "French Fries")

      attrs = %{
        ordered_at: "2010-04-17 14:00:00.000000Z",
        state: "created",
        items: [
          %{menu_item_id: chai.id, quantity: 1},
          %{menu_item_id: fries.id, quantity: 2}
        ]
      }

      assert {:ok, %Order{} = order} = Ordering.create_order(attrs)

      assert Enum.map(
               order.items,
               &Map.take(&1, [:name, :quantity, :price])
             ) == [
               %{name: "Masala Chai", quantity: 1, price: chai.price},
               %{name: "French Fries", quantity: 2, price: fries.price}
             ]

      assert order.state == "created"
    end
  end
end
