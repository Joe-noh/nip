defmodule Nip.RoomChannel do
  use Nip.Web, :channel

  def join("rooms:nippo", _message, socket) do
    {:ok, socket}
  end

  def handle_in("nippo:create", message, socket) do
    broadcast_from socket, "nippo:new", message

    {:reply, :ok, socket}
  end
end
