module GeneticAlgo
  module Environment
    module LifeCycle
      class SimpleLifeCycle
        def initialize(config_obj)
          @config_obj

          @generation = @config_obj.generation
        end

        def life_cycle
          cycle_logic
        end

        def cycle_logic(&block)
          if block.given?
            yield
          else

          end
        end
      end
    end
  end
end