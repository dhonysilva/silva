defmodule Silva.Repo.Migrations.CreateMedias do
  use Ecto.Migration

  def change do
    create table(:medias) do
      add :name, :string
      add :description, :string
      add :content, :string
      add :media_type, :string

      timestamps(type: :utc_datetime)
    end
  end
end
