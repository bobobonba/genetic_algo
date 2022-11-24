module GeneticAlgo
  module Environment
    module Select
      class AbstractSelect
        def self.select(array)
          select_logic(array)
        end
  
        #継承したクラスはこのメソッドを実装する
        def self.select_logic(array)
        end
      end
    end
  end
end
