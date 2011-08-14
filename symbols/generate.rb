def random_string
  var = ''

  10.times do
    var += ('a'..'z').to_a[rand(26)]
  end

  return var
end
