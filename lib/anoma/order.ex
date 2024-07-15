defmodule Anoma.Order do
  @moduledoc """
  I am the Order module, I am the format responsible for making sure
  that the given process is told that it can be read or executed at
  the given index
  """
  use TypedStruct
  alias __MODULE__

  @typedoc """
  I am the Order type. I have information regarding a correct order
  and having a proper host to ping to notify when it can do a certain
  task.

  ### Fields
    - `index` - the ordering index to execute at
    - `id` - the identification key path of the requested key
    - `addr` - the address of the local engine to message
  """
  typedstruct enforce: true do
    field(:index, non_neg_integer())
    field(:id, any())
    field(:addr, Anoma.Node.Router.Addr.t())
  end

  def new(index, id, addr) do
    %Order{index: index, id: id, addr: addr}
  end

  @spec index(t()) :: non_neg_integer()
  def index(t), do: t.index

  @spec id(t()) :: any()
  def id(t), do: t.id

  @spec addr(t()) :: Anoma.Node.Router.Addr.t()
  def addr(t), do: t.addr
end