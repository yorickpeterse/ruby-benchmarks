require File.expand_path('../generate', __FILE__)
require 'pp'

def profile
  yield

  pp ObjectSpace.count_objects
end

profile do
  puts 'Strings'

  1000.times do
    random_string
  end
end

profile do
  puts 'Symbols'

  1000.times do
    random_string.to_sym
  end
end
