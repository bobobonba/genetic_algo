module GeneticAlgo
  module Select
    class RouletteSelect
      def self.cumulative_sum(array)
        cumu_array_size = array.size + 1
        cumu_array = Array.new
        sum = 0
  
        cumu_array_size.times do |i|
          if i.zero?
            cumu_array << sum
          else 
            cumu_array << sum += array[i - 1]
          end
        end
  
        cumu_array
      end
  
      #インデックスを返す
      def self.roulette_select(fitness_array)
        array_sum = fitness_array.sum
        chosen_num = array_sum * rand()
        cumu_array = cumulative_sum(fitness_array)
  
        cumu_array.size.times do |num|
          if chosen_num <= cumu_array[num]
            break num - 1
          end
        end
      end
    end
  end
end