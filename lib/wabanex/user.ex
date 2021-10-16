defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :password, :name, :height, :weight, :fat_index, :muscle_index]
  @required_fields [:email, :password, :name, :height, :weight]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :height, :float
    field :weight, :float
    field :fat_index, :float, default: 0.0
    field :muscle_index, :float, default: 0.0

    has_many :trainings, Training

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@required_fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> validate_number(:height, greater_than: 0)
    |> validate_number(:weight, greater_than: 0)
    |> validate_number(:fat_index, greater_than: 0, less_than_or_equal_to: 100)
    |> validate_number(:muscle_index, greater_than: 0, less_than_or_equal_to: 100)
    |> unique_constraint([:email])
  end
end
