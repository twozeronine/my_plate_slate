defmodule MyPlateSlate.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :description, :string
      add :name, :string, null: false
    end
  end
end
