How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
  - Run bundle gem covid_19_tracker
3. Start with the entry point - the file run
  - Create a covid-19-tracker file within /bin
  - include "#!/usr/bin/env ruby" at the top of file.
  - want to run from console using ./bin/covid-19-tracker
  -- view permissions
  - cd bin/
  - ls -lah
  -- add executable permission
  - chmod +x covid-19-tracker
  --test
  -  puts "Hello World"
  - run ./bin/covid-19-tracker

4. force that to build the CL interface
5. stub out the interface
6. start making things real
7. discover objects.
8. program

A command line interface which tracks covid-19 cases, deaths, recoveries, and vaccination rates
