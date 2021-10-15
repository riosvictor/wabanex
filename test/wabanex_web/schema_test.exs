defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "Paulo", email: "paulo@abacaxi.com", password: "password"}

      {:ok, %User{id: user_id}} = Create.call(params)

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
            name: "Paulo", email: "paulo@abacaxi.com", password: "password"
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
end
