defmodule Nip.RoomChannel do
  use Phoenix.Channel

  def join("rooms:nippo", _message, socket) do
    {:ok, socket}
  end
end
