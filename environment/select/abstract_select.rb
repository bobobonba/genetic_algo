module GeneticAlgo
  module Select
    class AbstractSelect
      def self.select(chromosomes)
        select_logic(chromosomes)
      end

      #継承したクラスはこのメソッドを実装する
      def self.select_logic(chromosomes)
      end
    end
  end
end
