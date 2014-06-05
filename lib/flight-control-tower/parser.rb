require 'json'

module FlightControlTower
  class Parser
    def self.parse files_to_parse
      results = {}
      files_to_parse.each do |f|

        content = File.read(f)
        next unless content.match(/defineComponent/)

        component_name = File.basename(f)
        results[component_name] = { outbound: [], inbound: [] }

        inbound = content.scan(/this.on\((.+?)\)/).map{|e| e[0].split(',').map(&:strip) }
        inbound.each do |args|
          results[component_name][:inbound] << args[0] if args.length == 2
          results[component_name][:inbound] << args[1] if args.length == 3
        end

        outbound = content.scan(/this.trigger\((.+?)\)/).map{|e| e[0].split(',').map(&:strip) }
        outbound.each do |args|
          args.shift if args[0] == 'document'
          results[component_name][:outbound] << args.shift
        end
        results[component_name][:inbound].uniq!
        results[component_name][:outbound].uniq!

      end

      graph = []
      results.each_pair do |component_name, component_events|
        component_events[:inbound].each do |event|
          results.each_pair do |next_component_name, next_component_events|
            next if component_name == next_component_name
            if results[next_component_name][:outbound].include?(event)
              graph << { source: next_component_name, dest: component_name, type: event }
            end
          end
        end
      end

      results.each_pair do |component_name, component_events|
        component_events[:outbound].each do |event|
          results.each_pair do |next_component_name, next_component_events|
            next if component_name == next_component_name
            if results[next_component_name][:inbound].include?(event)
              graph << { source: component_name, dest: next_component_name, type: event }
            end
          end
        end
      end
  
      puts graph.to_json

    end
  end
end
