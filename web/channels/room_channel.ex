defmodule Nip.RoomChannel do
  use Phoenix.Channel

  def join("rooms:nippo", _message, socket) do
    {:ok, socket}
  end

  def handle_in("nippo:create", message, socket) do
    broadcast_from socket, "nippo:new", message

    {:reply, :ok, socket}
  end
end
