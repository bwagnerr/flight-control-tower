require 'erb'

module FlightControlTower
  class View
    def initialize graph
      @graph = graph
    end

    def build
      b = binding
      File.open('control_tower.html', 'w') do |f|
        erb = File.read(File.dirname(__FILE__) + '/../views/control_tower.erb')
        f.puts(ERB.new(erb).result(b))
      end
    end
  end
end
 
