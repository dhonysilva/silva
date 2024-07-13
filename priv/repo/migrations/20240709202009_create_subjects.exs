defmodule Silva.Repo.Migrations.CreateSubjects do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
