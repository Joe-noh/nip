defmodule Nip.RoomChannel do
  use Phoenix.Channel

  def join("rooms:nippo", _message, socket) do
    {:ok, socket}
  end

  def handle_in("nippo:create", %{"name" => name, "body" => body}, socket) do
    IO.inspect body

    {:reply, :ok, socket}
  end
end
