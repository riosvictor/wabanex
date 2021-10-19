defmodule Wabanex.TrainingTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.Training

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      final_date = Date.add(Date.utc_today(), 10)

      params = %{
        end_date: Date.utc_today(),
        start_date: final_date,
        user_id: "8e6212d6-3faf-4426-adcb-ed48d7390146"
      }

      response = Training.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{
                 end_date: ~D[2021-10-19],
                 start_date: ~D[2021-10-29],
                 user_id: "8e6212d6-3faf-4426-adcb-ed48d7390146"
               },
               errors: []
             } = response
    end

    test "when there are invalid params, returns a invalid changeset" do
      params = %{
        end_data: Date.utc_today(),
        start_date: Date.utc_today()
      }

      response = Training.changeset(params)

      expected_response = %{end_date: ["can't be blank"], user_id: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
