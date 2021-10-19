defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{
        name: "Paulo",
        email: "paulo@abacaxi.com",
        password: "password",
        height: 1.45,
        weight: 91
      }

      {:ok, %User{id: user_id}} = Users.Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "paulo@abacaxi.com",
            "name" => "Paulo"
          }
        }
      }

      assert response == expected_response
    end

    test "when a invalid id is given, returns an error", %{conn: conn} do
      id = "f1fea72a-7c34-4870-9777-23acefe095b1"

      query = """
        {
          getUser(id: "#{id}"){
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{
               "errors" => [
                 %{
                   "message" => "User not found"
                 }
               ]
             } = response
    end
  end

  describe "users mutations" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "Paulo",
            email: "paulo@abacaxi.com",
            password: "password",
            height: 1.70,
            weight: 69
          }){
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{"email" => "paulo@abacaxi.com", "id" => _id, "name" => "Paulo"}
               }
             } = response
    end
  end

  describe "training mutations" do
    test "when all params are valid, creates the training", %{conn: conn} do
      params = %{
        name: "Paulo",
        email: "paulo@abacaxi.com",
        password: "password",
        height: 1.45,
        weight: 91
      }

      {:ok, %User{id: user_id}} = Users.Create.call(params)

      mutation = """
        mutation {
          createTraining(input: {
            start_date: "2021-10-19",
            end_date: "2021-10-29",
            user_id: "#{user_id}"
          }){
            id
            start_date
            end_date
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createTraining" => %{
                   "id" => _id,
                   "end_date" => "2021-10-29",
                   "start_date" => "2021-10-19"
                 }
               }
             } = response
    end
  end
end
