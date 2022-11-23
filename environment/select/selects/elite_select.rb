module GeneticAlgo
  module Select
    class EliteSelect
      def self.elite_select(fitness_array, num)
        array = fitness_array.map{ |i| i }
        sorted_array = array.sort
        answer = Array.new

        num.times do |n|
          answer << array.index(sorted_array[-1 - n])
        end
        answer
      end
    end
  end
end
