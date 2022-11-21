require 'csv'

class Generater
  def initialize(size, *char)
    @file = CSV.open('./problem.csv', 'w+')
    @char_list = char

    generate(size)
    @file.close
  end

  def generate(size)
    size.times do |num|
      @file.puts([num + 1, @char_list.sample])
    end
  end
end