defmodule TeacherWeb.FallbackController do
  use TeacherWeb, :controller

  def call(conn, {:error, msg}) when is_binary(msg) do
    conn
    |> put_flash(:error, msg)
    |> redirect(to: album_path(conn, :index))
  end

  def call(conn, {:error, %Ecto.Changeset{}}) do
    conn
    |> put_flash(:error, get_msg(conn))
    |> redirect(to: album_path(conn, :index))
  end

  defp get_msg(conn) do
    name = action_name(conn)
    Map.get(error_msgs(), name, "There was an issue")
  end

  defp error_msgs do
    %{create: "There was an issue creating the movie",
      update: "There was an issue updating the movie"}
  end

end
