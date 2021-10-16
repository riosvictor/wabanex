defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic user representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :height, non_null(:float)
    field :weight, non_null(:float)
    field :fat_index, :float
    field :muscle_index, :float
    field :trainings, list_of(:training)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "Users name"
    field :email, non_null(:string), description: "Users email"
    field :password, non_null(:string), description: "Users password"
    field :height, non_null(:float), description: "Users height"
    field :weight, non_null(:float), description: "Users weight"
    field :fat_index, :float, description: "Users fat index"
    field :muscle_index, :float, description: "Users muscle index"
  end
end
