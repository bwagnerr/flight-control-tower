require 'flight-control-tower/parser'
require 'flight-control-tower/view'
require 'yaml'

module FlightControlTower
  class ControlTower
    def initialize(config_file)
      @config_file = config_file
    end

    def report_traffic
      config = YAML.load_file(@config_file)
      files_to_parse = Dir[config["include_pattern"]] - Dir[config["exclude_pattern"]]
      graph = Parser.parse(files_to_parse)
      View.new(graph).build
    end
  end
end

