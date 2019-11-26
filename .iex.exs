time = fn n ->
  start = System.monotonic_time(:millisecond)
  res = Sequence.m(n)
  IO.puts("#{res}\nElapsed time: #{abs(System.monotonic_time(:millisecond) - start)} msecs")
end
