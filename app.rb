#!/usr/bin/env ruby

# myapp.rb
# gem install sinatra puma

require 'logger'
def runner 
  # Create a Logger that prints to STDOUT
  log = Logger.new(STDOUT)
  log.debug("Created Logger")
  result = "4"
  log.info("Program finished")
  log.info("RESULT is: #{result}")
  current = Time.new.to_s + " : Running: #{result} :-) \n"
  return "#{current}"
end

require 'sinatra'

class Stream
  def each
    # 24 Stunden:
    5760.times { |i| 
      yield "#{i} : " + runner
      sleep 15
      yield "<hr>"
      }
  end
end

get '/' do 
    Stream.new
end
  
