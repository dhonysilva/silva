defmodule Silva.Medias.Media do
  use Ecto.Schema
  import Ecto.Changeset

  schema "medias" do
    field :name, :string
    field :description, :string
    field :content, :string
    field :media_type, Ecto.Enum, values: [:text, :video, :picture]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [:name, :description, :content, :media_type])
    |> validate_required([:name, :description, :content, :media_type])
  end
end
