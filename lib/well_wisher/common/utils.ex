defmodule WellWisher.Common.Utils do
  def add_keys_to_target_map(target, extras) do
    Enum.reduce(extras, target, fn {key, value}, target ->
      Map.put(target, key, value)
    end)
  end
end
