flight-control-tower
====================

A tool to plot your flightjs events and components and how they interact

Installing
==========

run `gem install flight-control-tower`

Running
=======

Create a yml file (lets call it control-tower.yml) in your flight app root folder with the following format:

  ---
  include_pattern: 'pattern/for/inclusion'
  exclude_pattern: 'pattern/for/exclusion'


Then run
` flight-control-tower control-tower.yml`
