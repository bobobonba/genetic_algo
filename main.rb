require './genetic_algo'

life_cycle = GeneticAlgo::Environment::LifeCycle::SimpleLifeCycle.new(GeneticAlgo::Config::Config.new('./config.yaml'))
life_cycle.life_cycle