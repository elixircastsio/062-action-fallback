defmodule TeacherWeb.AlbumController do
  use TeacherWeb, :controller

  alias Teacher.Records
  alias Teacher.Records.Album

  action_fallback TeacherWeb.FallbackController

  def show(conn, %{"id" => id}) do
    with {:ok, album} <- Records.get_album(id) do
      render(conn, "show.html", album: album)
    end
  end

  def edit(conn, %{"id" => id}) do
    with {:ok, album} <- Records.get_album(id) do
      changeset = Records.change_album(album)
      render(conn, "edit.html", album: album, changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "album" => album_params}) do
    with {:ok, album} <- Records.get_album(id),
          {:ok, album} <- Records.update_album(album, album_params) do

      conn
      |> put_flash(:info, "Album updated successfully")
      |> redirect(to: album_path(conn, :show, album))
    end
  end

  def create(conn, %{"album" => album_params}) do
    with {:ok, album} <- Records.create_album(album_params) do
      conn
      |> put_flash(:info, "Album created successfully.")
      |> redirect(to: album_path(conn, :show, album))
    end
  end

  def index(conn, _params) do
    albums = Records.list_albums()
    render(conn, "index.html", albums: albums)
  end

  def new(conn, _params) do
    changeset = Records.change_album(%Album{})
    render(conn, "new.html", changeset: changeset)
  end

end
