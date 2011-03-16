require File.expand_path('spec/spec_helper')
STDOUT.sync = true # otherwise results can go weird...

def callback(x)
  Thread.exclusive { puts x }
end

result = Parallel.map(1..10, :callback => method(:callback)) do |x|
  x * 2
end
