time = fn n ->
  start = System.monotonic_time(:millisecond)
  res = Sequence.m(n)
  IO.puts("#{res}\nElapsed time: #{abs(System.monotonic_time(:millisecond) - start)} msecs")
end

start_agent = fn ->
  Agent.start_link(&Map.new/0, name: Sequence)
end
