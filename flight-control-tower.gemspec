Gem::Specification.new do |s|
  s.name        = "flight-control-tower"
  s.version     = "0.2.1"
  s.summary     = "Plot your flightjs components and its events interactions"
  s.date        = "2014-06-04"
  s.description = "This gem parses your flight components and stores their event interactions to later plot it using d3"
  s.authors     = ["Duda Dornelles"]
  s.email       = ["duda@thoughtworks.com"]
  s.files       = Dir.glob("{bin,lib}/**/*")
  s.executables = ['flight-control-tower']
end
